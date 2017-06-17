class AddCategoryIdToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :category_id, :integer
  end
end
