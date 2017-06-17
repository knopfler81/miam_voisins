class AddCategoryToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :category, :string
  end
end
