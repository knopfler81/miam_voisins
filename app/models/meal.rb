class Meal < ApplicationRecord
  has_attachments :images, maximum: 3
  belongs_to :category
  has_many :ingredients
  has_many :orders
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :menu_name, :price, :portion, :availability, :category, :location , :category, presence: true

  has_many :reviews
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :location_changed?


  def passed?
    true if availability < Date.current
  end

  def self.coming
    where('availability >= ?', Date.current)
  end

  def self.passed
    where('availability < ?', Date.current)
  end

  def left_meal
   meals = 0
    orders.each do |order|
      meals += order.quantity if order.payment_status?
    end
    left_meal = self.portion - meals
    return left_meal.to_i
  end

  def self.search(search)
    if search
     where(["lower(location) LIKE ?","%#{search.downcase}%"]).order('created_at DESC')
    else
      all
    end
  end
end
