class Ingredient < ApplicationRecord
  belongs_to :meal,required: false
end
