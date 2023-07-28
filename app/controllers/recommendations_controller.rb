class RecommendationsController < ApplicationController
  skip_after_action :verify_authorized
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

  private

  def recommendation_params
    params.require(:user_gift_recomendation).permit(:list_id)

  end
end
