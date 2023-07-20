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
end
