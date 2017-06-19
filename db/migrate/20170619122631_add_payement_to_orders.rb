class AddPayementToOrders < ActiveRecord::Migration[5.0]
  def change
    add_monetize :orders, :amount, currency: { present: false }
    add_column   :orders, :payment, :json
  end
end
