class AddListToUserGiftRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_gift_recomendations, :list, foreign_key: true
  end
end
