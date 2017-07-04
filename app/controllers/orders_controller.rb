class OrdersController < ApplicationController
  before_action :find_meal, only: [:create]
  before_action :find_order, only: [:show, :update]


  def show
    @meal = @order.meal
  end

  def create
    if current_user == nil
      redirect_to new_user_registration_path
    else
      if current_user.completed_profile?
        @order = Order.new(order_params)
        @order.user = current_user
        @order.meal = @meal
        if @order.save
          redirect_to order_path(@order)
        else
          redirect_to meal_path(@meal)
        end
      else
        session[:redirect_to] = meal_path(@meal)
        redirect_to edit_user_registration_path, notice: 'Merci de compléter votre profile pour passer commande'
      end
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Payement successed"
    else
      redirect_to @order, error: "Payement failed"
    end
  end

  def pay
    @order.payment
    redirect_to @order
  end



  private

  def order_params
    params.require(:order).permit(:message, :payment_status, :quantity, :user_id, :meal_id)
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def find_meal
    @meal = Meal.find(params[:meal_id])
  end


end
