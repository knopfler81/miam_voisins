class Meal < ApplicationRecord


  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :menu_name, :price, :portion, :availability, :category, presence: true

  belongs_to :user
end
