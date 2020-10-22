class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :search_purchase, only: [:edit, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :restrict_sold_out, only: :edit

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @orders_done = Purchase.includes(:user, :item)
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

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :shipping_cost_id, :shipping_prefecture_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def search_purchase
    @order_done = Purchase.find_by(item_id: params[:id])
  end

  def restrict_sold_out
    if @order_done.present?
      redirect_to root_path
    end
  end
end
