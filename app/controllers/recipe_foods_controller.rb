class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    respond_to do |format|
      format.html { render :new, locals: { recipe_food: @recipe_food } }
    end
  end

  def create
    @recipe_food = RecipeFood.find_by(recipe: recipe_food_params[:inventory],
                                      food_id: recipe_food_params[:food_id])

    if @recipe_food
      @recipe_food.increment(:quantity, inventory_food_params[:quantity].to_i)
      @recipe_food.save
      flash[:sucess] = 'Recipe_food updated successfully'
    else
      RecipeFood.create(recipe_food_params)
      flash[:sucess] = 'Recipe_food created successfully'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe_food.delete
      flash[:sucess] = 'Food deleted successfully'
    else
      flash.now[:error] = 'Error: Recipe could not be deleted'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
