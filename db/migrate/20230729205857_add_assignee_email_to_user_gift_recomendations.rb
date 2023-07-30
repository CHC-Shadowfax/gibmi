class AddAssigneeEmailToUserGiftRecomendations < ActiveRecord::Migration[7.0]
  def change
    add_column :user_gift_recomendations, :assignee_email, :string
  end
end
