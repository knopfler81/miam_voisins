class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :message
      t.boolean :payment_status, default: false
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true


      t.timestamps
    end
  end
end
