class RemoveGiftIdFromUserGiftRecomendations < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_gift_recomendations, :gift_id, :bigint
    add_column :user_gift_recomendations, :name, :string
    add_column :user_gift_recomendations, :description, :string
    add_column :user_gift_recomendations, :image, :string
    add_column :user_gift_recomendations, :price, :float
    add_column :user_gift_recomendations, :url, :string
  end
end
