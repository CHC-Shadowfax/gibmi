class AddPurchasePlacesToUserGiftRecomendation < ActiveRecord::Migration[7.0]
  def change
    add_column :user_gift_recomendations, :purchase_places, :string
  end
end
