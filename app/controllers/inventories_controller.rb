class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories
  end

  def show; end

  def new
    @inventory = Inventory.new
    respond_to do |format|
      format.html { render :new, locals: { inventory: @inventory } }
    end
  end



  def destroy
    Inventory.destroy(params[:id])
    redirect_to inventories_path
  end


end
