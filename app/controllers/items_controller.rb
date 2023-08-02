class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: :new
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render action: :edit, status: :unprocessable_entity
   end
  end
  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :status_id, :prefecture_id, :cost_bearer_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
