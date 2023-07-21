# app/workers/hard_worker.rb
class RecommendationsWorker
  include Sidekiq::Worker

  def perform(user_id)
    # Place your long-running job here, for example:
    # sleep 5
    user = User.find(user_id)

    RecommendationService.new(user).call(
      user.categories.pluck(:title).join(", ")
    )
  end
end
