class MealsController < ApplicationController

  before_action :find_meal, only: [:show, :update, :edit, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
   if current_user.completed_profile?
     @meal = Meal.new
   else
     redirect_to edit_user_registration_path, alert: 'Please complete your profile to create a tuto'
   end
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'meal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @meal.destroy
  end

  def update
  end

  def edit
  end

  private

  def find_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal)
    .permit(:menu_name,
            :price,
            :portion,
            :availability)
  end
end
