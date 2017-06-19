class PaymentsController < ApplicationController
  before_action :set_order

    def create
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )

      charge = Stripe::Charge.create(
        customer:     customer.id,   # You should store this customer id and re-use it.
        amount:       @order.amount_cents, # or booking_price_pennies
        description:  "Paiement pour le repas#{@order.meal.menu_name} pour l'order id:  #{@order.id}",
        currency:     @order.amount.currency
      )

      @order.update(payment: charge.to_json, payment_status: true)

      redirect_to user_path(current_user), notice: "Paiement  validé"

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_order_payment_path(@order)

    end

  private

    def set_order
      @order = Order.where(payment_status: false).find(params[:order_id])
    end

end
