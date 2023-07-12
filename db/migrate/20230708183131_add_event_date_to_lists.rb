class AddEventDateToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :event_date, :date
  end
end
