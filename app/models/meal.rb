class Meal < ApplicationRecord
  has_attachments :images, maximum: 3

  belongs_to :category
  belongs_to :user

  has_many :ingredients
  has_many :orders
  has_many :notifications, as: :topic
  has_many :reviews

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  geocoded_by :location

  after_validation :geocode, if: :location_changed?
  validates :menu_name, :price, :portion, :availability, :category, :location , :category, presence: true


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
