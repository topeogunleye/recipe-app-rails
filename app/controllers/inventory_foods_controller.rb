class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    respond_to do |format|
      format.html { render :new, locals: { inventory_food: @inventory_food } }
    end
  end

  def create
    @inventory_food = InventoryFood.find_by(inventory: inventory_food_params[:inventory],
                                            food_id: inventory_food_params[:food_id])

    if @inventory_food
      @inventory_food.increment(:quantity, inventory_food_params[:quantity].to_i)
      @inventory_food.save
      flash[:sucess] = 'Inventory_food updated successfully'
    else
      InventoryFood.create(inventory_food_params)
      flash[:sucess] = 'Inventory_food created successfully'
    end
    redirect_to inventory_path(params[:inventory_id])
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])

    if @inventory_food.delete
      flash[:sucess] = 'food deleted successfully'
    else
      flash.now[:error] = 'Error: Inventory could not be deleted'
    end
    redirect_to inventory_path(params[:inventory_id])
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id).merge(inventory: Inventory.find(params[:inventory_id]))
  end
end
