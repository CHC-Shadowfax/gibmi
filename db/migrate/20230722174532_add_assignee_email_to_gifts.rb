class AddAssigneeEmailToGifts < ActiveRecord::Migration[7.0]
  def change
    add_column :gifts, :assignee_email, :string
  end
end
