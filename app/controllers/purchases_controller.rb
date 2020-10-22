class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :restrict_sold_out
  before_action :set_purchase
  
  def index
    @order_address = OrderAddress.new
    @order_address.present?
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def move_to_index
    if current_user.id == Item.find(params[:item_id]).user_id
      redirect_to root_path
    end
  end

  def restrict_sold_out
    set_purchase
    @order_done = Purchase.find_by_item_id(params[:item_id])
    if @order_done.present?
        return redirect_to root_path
    end
  end
  
  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :purchase_id).merge(token: params[:token], user_id: current_user.id, item_id: Item.find(params[:item_id]).id)
  end
  
  def pay_order
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
end
