class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  def payment
    self.payment_status = true
    self.save
  end

end
