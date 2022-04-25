class PurchasesController < ApplicationController
  before_action :set_merchandise
  

  def index
    @purchase_address = PurchaseAddress.new
    if current_user.id == @merchandise.user.id
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
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
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :street_number, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, token: params[:token], merchandise_id: params[:merchandise_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @merchandise.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
