class Category < ApplicationRecord
  has_many :meal

  validates :name, presence: true
end
