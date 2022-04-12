class MerchandisesController < ApplicationController
  def index
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise =Merchandise.new(merchandise_params)
    if @merchandise.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  def destroy
  end
end
