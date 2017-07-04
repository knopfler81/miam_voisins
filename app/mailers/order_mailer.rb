

class OrderMailer < ApplicationMailer
  default from: 'order_team@easytrip.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailler_mailer.order_confirmation.subject
  #
  def order_confirmation_buyer(order)
    @order = order

        mail(
          to:       @order.user.email,
          subject:  " Chouette, tu as commandé #{@order.meal.menu_name}!"
        )
  end

  def order_confirmation_maker(order)
    @order = order

        mail(
          to:       @order.meal.user.email,
          subject:  "Tu as reçu une commande: #{@order.meal.menu_name}!"
        )
  end
end
