class GiftsController < ApplicationController
  before_action :set_gift, only: %i[show edit update destroy]
  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new
  end

  def show
    @gifts = Gift.where(id: params[:id])
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    if @gift.save
      redirect_to gift_path(@gift)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path, notice: 'Gift was successfully destroyed.', status: :see_other
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description, :photo)
  end
end
