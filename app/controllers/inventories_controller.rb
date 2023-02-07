class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show; end

  def destroy
    Inventory.destroy(params[:id])
    redirect_to inventories_path
  end
end
