class AddSizeToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :size, :string
  end
end
