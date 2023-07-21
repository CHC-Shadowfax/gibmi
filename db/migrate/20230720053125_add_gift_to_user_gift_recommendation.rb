class AddGiftToUserGiftRecommendation < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_gift_recomendations, :gift, foreign_key: true
  end
end
