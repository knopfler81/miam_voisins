class MealsFilter

  def initialize(params)
    @params = params
    @meals = Meal.all #Meal.where('availability  >= ?', Date.today )
    #@meals = Meal.where('location LIKE?', @params[:query][:location]) if @params[:query][:location].present?
  end

  def filter
    filter_by_location
    filter_by_category
    @meals
  end


  private

  def filter_by_category
   if @params[:categories] != nil && @params[:categories].size != 0 && !@params[:categories].include?("all")
     @meals = @meals.joins(:category).where("categories.name IN (?)", @params[:categories])
    #@meals = Meal.where('location LIKE?', @params[:query][:location]) if @params[:query][:location].present?
   end
  end

  def filter_by_location
    @meals = Meal.where('location LIKE?', @params[:query][:location]) if @params[:query][:location].present?
  end
end
