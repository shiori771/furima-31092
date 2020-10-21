class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id)
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end
end
