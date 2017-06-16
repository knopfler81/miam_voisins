class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :menu_name
      t.integer :price
      t.integer :portion
      t.date :availability

      t.timestamps
    end
  end
end
