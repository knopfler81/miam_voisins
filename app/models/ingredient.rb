class Ingredient < ApplicationRecord

  belongs_to :meal,required: false
  validates :name, presence: true

end
