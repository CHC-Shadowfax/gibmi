class RemoveUserFromCatgories < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :user, null: false, foreign_key: true
  end
end
