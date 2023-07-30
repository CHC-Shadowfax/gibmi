class RecommendationsController < ApplicationController
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!, only: [:add_assignee_email, :add_assignee]

  def index
    @recommendations = policy_scope(current_user.user_gift_recomendations.page(params[:page])).per(9)
  end

  def generate
    RecommendationsWorker.perform_async(current_user.id)

    redirect_to recommendations_path
  end

  def show
    @recommendation = authorize UserGiftRecomendation.find(params[:id])
  end

  def update
    @recommendation = authorize UserGiftRecomendation.find(params[:id])
   if @recommendation.update!(recommendation_params)
    redirect_to lists_path(@recommendation.list, query: @recommendation.list.code)
   else
    render :show, status: :unprocessable_entity
   end
  end

  def add_assignee_email
    @gift = UserGiftRecomendation.find(params[:id])
    authorize @gift
    @gift.update!(params.require(:user_gift_recomendation).permit(:assignee_email))
    redirect_to lists_path(query: @gift.list.code), notice: 'Gift was successfully assigned, please create an account for more features', status: :see_other
  end

  def add_assignee
    @gift = UserGiftRecomendation.find(params[:id])
    authorize @gift
    @gift.assignee = current_user
    @gift.save
    redirect_to lists_path, notice: 'Gift was successfully assigned', status: :see_other
  end

  private

  def recommendation_params
    params.require(:user_gift_recomendation).permit(:list_id)
  end
end
