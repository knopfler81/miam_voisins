class Order < ApplicationRecord
  before_save :calculate_price
  belongs_to :user
  belongs_to :meal, dependent: :destroy

  has_many :notifications, as: :topic

  monetize :amount_cents, as: :amount

  def payment
    self.payment_status = true
    self.save
  end

  def calculate_price
    self.amount = (self.quantity * meal.price)
  end
end
