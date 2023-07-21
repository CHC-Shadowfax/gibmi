class AddSizeToFeatures < ActiveRecord::Migration[7.0]
  def change
    add_column :features, :size, :string
  end
end
