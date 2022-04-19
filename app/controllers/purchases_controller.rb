class PurchasesController < ApplicationController
  before_action :set_merchandise

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_merchandise
    @merchandise = Merchandise.find(params[:merchandise_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
