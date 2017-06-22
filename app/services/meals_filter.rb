class MealsFilter

  def initialize(params)
    @params = params
    @meals = Meal.all
  end

  def filter
    filter_by_category
    @meals = Meal.where('availability  >= ?', Date.today )

  end

  private

  def filter_by_category
   if @params[:categories] != nil && @params[:categories].size != 0 && !@params[:categories].include?("all")
     @meals = @meals.joins(:category).where("categories.name IN (?)", @params[:categories])
   end
  end

end
