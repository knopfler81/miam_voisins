class Meal < ApplicationRecord
  has_attachments :images, maximum: 4
  belongs_to :category
  has_many :ingredients
  has_many :orders
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :menu_name, :price, :portion, :availability, :category, presence: true

  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?



  def passed?
    true if availability < Date.current
  end

  def self.coming
    where(' availability >= ?', Date.current)
  end

  def self.passed
    where('availability < ?', Date.current)
  end
end
