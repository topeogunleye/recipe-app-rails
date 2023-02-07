class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
  end

  def show
  end
end
