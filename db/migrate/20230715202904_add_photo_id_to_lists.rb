class AddPhotoIdToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :photo_id, :string
  end
end
