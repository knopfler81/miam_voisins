class AddLocationToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :location, :string
  end
end
