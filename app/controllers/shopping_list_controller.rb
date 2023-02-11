class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.includes(:foods, :inventory_foods).find(params[:inventory_id])
    @recipe = Recipe.includes(:food, :recipe_foods).find(params[:recipe_id])

    @missing_foods = []
    @total_food_price = 0

    @recipe.food.each do |food|
      inventory_food = @inventory.inventory_foods.find_by(food:)
      recipe_food = @recipe.recipe_foods.find_by(food:)

      if inventory_food.nil?
        @missing_foods << {
          name: food.name,
          quantity: recipe_food.quantity,
          price: food.price
        }
        @total_food_price += food.price * recipe_food.quantity
      elsif inventory_food.quantity < recipe_food.quantity
        missing_food_quantity = recipe_food.quantity - inventory_food.quantity
        @missing_foods << {
          name: food.name,
          quantity: missing_food_quantity,
          price: food.price
        }
        @total_food_price += food.price * missing_food_quantity
      end
    end
  end
end
