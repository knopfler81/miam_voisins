class ChangeUserIdInOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :user_id
    add_column :orders, :maker_id, :integer
    add_column :orders, :buyer_id, :integer
  end
end
