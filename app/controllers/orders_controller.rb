class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order = UserPurchases.new
  end

  def create 
    @order = UserPurchases.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_purchases).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item =  Item.find(params[:item_id])
  end
  
end
#インデックスアクションに @order を定義する
#order_paramsに.require(:モデル名)を追記する
#order_paramsの.mergeメソッドにitem_idというキーと値を追記する