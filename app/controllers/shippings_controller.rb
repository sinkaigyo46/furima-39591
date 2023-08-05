class ShippingsController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index  
    
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    
    if  @item.user_id == current_user.id || @item.shipping.present?
      redirect_to root_path
    end
  end
  
  def create
     @item = Item.find(params[:item_id])
     @order = Order.new(order_params)
    if @order.valid?
       pay_item
       @order.save 
       redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  

  def order_params
    params.require(:order).permit(:postal_code, :city_town, :street_number, :building_name, :phone_number, :shipping, :prefecture_id,).merge(item: params[:item_id],user: current_user.id, token: params[:token])
  end
  
  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end
end
