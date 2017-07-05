class StartConversation

  def initialize(order)
    @order = order
  end

  def conversation_with_maker
    Conversation.create(
      sender_id: @order.meal.user,
      recipient_id: @order.user,
      order_id: @order.id
      )
  end
  def conversation_with_buyer
    Conversation.create(
      sender_id: @order.meal.user,
      recipient_id: @order.user,
      order_id: @order.id
      )
  end
end
