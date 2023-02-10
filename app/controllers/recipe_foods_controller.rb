class RecipeFoodsController < ApplicationController

  def new
    @recipe_food = RecipeFood.new	
    respond_to do |format|
      format.html { render :new, locals: { recipe_food: @recipe_food } }
    end

  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    if @recipe_food.save
      redirect_to @recipe
    else
      render 'recipes/show'
    end
  end

  # def destroy
  #   @recipe = Recipe.find(params[:recipe_id])
  #   @recipe_food = @recipe.recipe_foods.find(params[:id])
  #   @recipe_food.destroy
  #   redirect_to @recipe
  # end
  
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