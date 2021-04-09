class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  def item_params
  params.require(:item).permit(:item_name, :category_id, :price, :status_id, :description, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :image).merge(user_id: current_user.id)
  end
end
