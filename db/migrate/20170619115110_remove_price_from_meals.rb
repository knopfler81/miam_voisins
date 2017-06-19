class RemovePriceFromMeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :price
  end
end
