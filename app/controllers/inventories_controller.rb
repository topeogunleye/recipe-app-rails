class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories
  end

  def show
    @inventory = Inventory.includes(:inventory_foods).find(params[:id])
  end

  def new
    @inventory = Inventory.new
    respond_to do |format|
      format.html { render :new, locals: { inventory: @inventory } }
    end
  end

  def create
    @inventory = Inventory.new(inventory_params)
    respond_to do |format|
      format.html do
        if @inventory.save
          flash[:sucess] = 'Inventory Saved successfully'
          redirect_to inventories_path
        else
          flash.now[:error] = 'Error: Inventory could not be saved'
          render { render :new, locals: { inventory: @inventory } }
        end
      end
    end
  end

  def destroy
    Inventory.destroy(params[:id])
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description).merge(user: current_user)
  end
end
