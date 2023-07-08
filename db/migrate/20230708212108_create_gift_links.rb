class CreateGiftLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :gift_links do |t|
      t.string :link

      t.timestamps
    end
  end
end
