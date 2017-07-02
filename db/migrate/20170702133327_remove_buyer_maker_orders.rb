class RemoveBuyerMakerOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :user_id, :integer
     remove_column  :orders, :maker_id
    remove_column :orders, :buyer_id
  end
end
