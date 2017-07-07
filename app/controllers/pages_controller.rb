class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end


  def index
    session[:conversations] ||= []
    @meals = Meal.all
    @orders = Order.all
    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
end
