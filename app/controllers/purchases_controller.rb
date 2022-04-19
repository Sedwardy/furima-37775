class PurchasesController < ApplicationController
  before_action :set_merchandise

  def index
    @purchase = Purchase.includes(:merchandise)
    
  end

  private

  def set_merchandise
    @merchandise = Merchandise.find(params[:merchandise_id])
  end

  def merchandise_params
    params.require(:merchandise).permit(:goods_name, :price, :prefecture_id, :explain, :category_id, :condition_id, :delivery_fee_id, :date_of_shipping_id, :image).merge(user_id: current_user.id)
  end
end
