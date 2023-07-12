class GiftsController < ApplicationController
  before_action :set_gift, only: %i[show edit update destroy]
  def index
    @gifts = policy_scope Gift.all
  end

  def new
    @gift = authorize Gift.new
  end

  def show
    @gift = authorize Gift.find_by(id: params[:id])
  end

  def create
    @gift = authorize Gift.new(gift_params)
    @gift.user = current_user
    if @gift.save
      redirect_to gift_path(@gift)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @gift = authorize Gift.find(params[:id])
  end

  def update
    @gift = authorize Gift.find(params[:id])
    if @gift.update(gift_params)
      redirect_to gift_path(@gift)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:gift).permit(:name, :description, :photo, :list_id, :address)
  end
end
