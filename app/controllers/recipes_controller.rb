class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods

    @inventory_data = Inventory.all
    return if params[:inventory_id].nil?

    recipe_food_list = RecipeFood.where(recipe_id: params[:id] || params[:recipe_id]).pluck(:food_id)
    @if_foods_list = InventoryFood.where(inventory_id: params[:inventory_id]).pluck(:food_id)
    @inventory = Inventory.find(params[:inventory_id])
    diff = recipe_food_list - @if_foods_list
    @meta_data = Food.where(id: diff).pluck(:id, :name, :measurement_unit, :price)
    @total_price = 0
    @meta_data.each do |item|
      @total_price += RecipeFood.find_by(food_id: item[0]).quantity * item[3]
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @render } }
    end
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shopping_list
    @recipe_shopping = Recipe.find(params[:id]).recipe_foods
    @food = []
    @recipe_shopping.ids.each do |_id|
      @food.push(Food.find_by(:id))
    end
    @user_food = current_user.foodss
    @comparison_food = custom_difference(@food, @user_food)
    @food.each do |a|
      puts a.name
    end
    puts 'hello'
    @user_food.each do |a|
      puts a.name
    end
    same_food_result = same_food(@food, @user_food)
    if same_food_result.zero?
      @comparison_food
    else
      @comparison_food.append(same_food(@food, @user_food))
    end
  end

  def new_ingredient
    @recipe = Recipe.find(params[:id])
    @recipe_food = @recipe.recipe_foods.build
    @ingredient = RecipeFood.create(recipe_id: params[:recipe_id], food_id: params[:food_id],
                                    quantity: params[:quantity])

    if @ingredient.save
      flash[:notice] = 'Ingredient was successfully created.'
      redirect_to recipe_url(params[:recipe_id])
    else
      flash[:alert] = 'Ingredient was not created.'
      render :new_ingredient
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description,
                                   :public).merge(user_id: current_user.id)
  end

  def same_food(_food, _user_food)
    @comparis_food = []
    @user_food.each do |uf|
      @food.each do |rf|
        next unless uf.name == rf.name
        next if (uf.quantity - rf.quantity).zero?

        uf.quantity = uf.quantity - rf.quantity
        @comparis_food.push(uf)
      end
    end
    if @comparis_food.count.zero?
      0
    else
      @comparis_food
    end
  end

  def custom_difference(all, subset)
    all.select do |all_curr|
      subset.find do |subset_curr|
        subset_curr.name == all_curr.name
      end.nil?
    end
  end
end
