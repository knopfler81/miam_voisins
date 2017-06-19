class ChangePriceFormatInMeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :price_cents
    add_column :meals, :price, :integer
  end
end
