class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: :new
  def index
  end
  def new
    @item = Item.new
  end
  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to items_path
  else
    render :new, status: :unprocessable_entity
  end
  end
  




  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :status_id, :prefecture_id, :cost_bearer_id,:shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
