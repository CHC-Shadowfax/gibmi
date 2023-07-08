class AddGiftToGiftLink < ActiveRecord::Migration[7.0]
  def change
    add_reference :gift_links, :gift, null: false, foreign_key: true
  end
end
