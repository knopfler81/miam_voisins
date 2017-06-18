class Meal < ApplicationRecord
  has_attachments :images, maximum: 4
  belongs_to :category
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :menu_name, :price, :portion, :availability, :category, presence: true

  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
