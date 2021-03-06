class MerchandisesController < ApplicationController
  before_action :set_merchandise, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  
  def index
    @merchandises = Merchandise.order(id: :DESC)
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise =Merchandise.new(merchandise_params)
    if @merchandise.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @merchandise.purchase != nil
      redirect_to root_path
    end
  end

  def update
    if @merchandise.update(merchandise_params)
      redirect_to merchandise_path
    else
      render :edit
    end
  end
  
  def destroy
    if current_user == @merchandise.user
    @merchandise.destroy
    end
    redirect_to root_path
  end

  private

  def merchandise_params
    params.require(:merchandise).permit(:goods_name, :price, :prefecture_id, :explain, :category_id, :condition_id, :delivery_fee_id, :date_of_shipping_id, :image).merge(user_id: current_user.id)
  end

  
  def set_merchandise
    @merchandise = Merchandise.find(params[:id])
  end

  
  def contributor_confirmation
    redirect_to root_path unless current_user == @merchandise.user
  end
end

