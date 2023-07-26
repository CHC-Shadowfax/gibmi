class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #   # # If user has no user_gift_recommendations
    #     create_user_gift_recommendations
    #   # # else
    #   #   # Create refresh button that deletes those user_gift_recomendations.
    #   #   current_user.user_gift_recomendations.destroy_all
    #       create_user_gift_recommendations
    #   # end
    # end

    # private

    # def create_user_gift_recommendations
    #   recommendation_service.call(current_user.categories)
    # end

    # def recommendation_service
    #   client = OpenAI::Client.new
    #   @recommendation_service ||= RecommendationService.new(client)
  end
end
