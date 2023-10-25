class InventoriesController < ApplicationController
  def index
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def edit
   @inventories = Inventory.find(params[:id])
  end

  def update
    inventory = Inventory.find(params[:id])
    inventory.update(inv_params)
    redirect_to root_path
  end

  def index
    @inventories = Inventory.where(user_id:1)
  end

  def create
    @inventory = Inventory.new(inv_params)
    @inventory.user_id = 1 #this only for time beging aadded
    if @inventory.save
      redirect_to @inventory
    else
      render 'new'
    end
  end

  private

  def inv_params
    params.require(:inventory).permit(:sku, :price, :quntity, :user_id)
  end
end
