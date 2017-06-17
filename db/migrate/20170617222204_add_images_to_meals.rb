class AddImagesToMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :images, :string
  end
end
