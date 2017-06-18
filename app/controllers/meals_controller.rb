class MealsController < ApplicationController

  before_action :find_meal, only: [:show, :update, :edit, :destroy]

  def index
    meal_filter = MealsFilter.new(params)
    @meals = meal_filter.filter
    @meals_count = @meals.count
    @categories = Category.all
  end

  def show
  end

  def new
   if current_user.completed_profile?
     @meal = Meal.new
   else
     redirect_to edit_user_registration_path, alert: 'Merci de compléter votre profile'
   end
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user = current_user
    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Repas créé avec succès.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @meal.destroy
  end

  def update
    if @meal.update(meal_params)
      redirect_to meal_path(@meal)
    else
      render :edit
    end
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
            :availability,
            :category_id,
            images: [],
            ingredients_attributes: [:id, :name, :_destroy])
  end
end
