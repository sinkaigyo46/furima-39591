class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
  end
  
  def edit
    if @item.shipping.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render action: :edit, status: :unprocessable_entity
   end
  end

  def destroy
    if @item.user == current_user
    @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :status_id, :prefecture_id, :cost_bearer_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    item = Item.find(params[:id])
    unless item.user_id == current_user.id
      redirect_to action: :index
    end
  end
  
  def set_item
    @item = Item.find(params[:id])
  end
end
