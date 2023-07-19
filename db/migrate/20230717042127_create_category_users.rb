class CreateCategoryUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
