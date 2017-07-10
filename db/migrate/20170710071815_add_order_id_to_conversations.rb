class AddOrderIdToConversations < ActiveRecord::Migration[5.0]
  def change
      add_reference :conversations, :order, foreign_key: true
  end
end
