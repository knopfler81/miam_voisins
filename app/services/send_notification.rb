class SendNotification

  def initialize(order)
    @order = order
  end

  def notify_cook
    Notification.create(
      user: @order.meal.user,
      topic: @order,
      content: "#{@order.user.full_name} a commandé #{@order.quantity} parts de #{@order.meal.menu_name}.",
      order_id: @order.id
    )
  end


end
