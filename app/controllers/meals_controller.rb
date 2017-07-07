class MealsController < ApplicationController

  before_action :find_meal, only: [:show, :update, :edit, :destroy]


  def index
    #filter_by_location if params[:query].present?
    meal_filter = MealsFilter.new(params)
    @meals = meal_filter.filter
    @meals_count = @meals.count
    #add_markers_on_map
    @categories = Category.all
  end

  def show
    @order = Order.new
    @review = Review.new
    @user = @meal.user
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
        format.html { redirect_to @meal, notice: 'Repas créé avec succès!' }
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
            :location,
            images: [],
            ingredients_attributes: [:id, :name, :_destroy])
  end


  def filter_by_location
    @meals = Meal.search(params[:query][:location]) if params[:query][:location].present?
  end

  # def filter_by_category
  #  if params[:categories] != nil && params[:categories].size != 0 && !params[:categories].include?("all")
  #    @meals = @meals.joins(:category).where("categories.name IN (?)", params[:categories])
  #  end
  # end

  def add_markers_on_map
    @meals_location = @meals.where.not(latitude: nil, longitude: nil)
    @markers_hash = Gmaps4rails.build_markers(@meals_location) do |meal, marker|
        marker.lat meal.latitude
        marker.lng meal.longitude
        marker.json({ :id => meal.id })
        marker.infowindow render_to_string(partial: "/meals/map_box", locals: { meal: meal })
    end
  end

end
