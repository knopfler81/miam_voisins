class Meal < ApplicationRecord
  validates :menu_name, :price, :portion, :availability, presence: true

 belongs_to :user
end
