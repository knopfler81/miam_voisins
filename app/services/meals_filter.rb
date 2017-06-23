class MealsFilter

  def initialize(params)
    @params = params
    @meals = Meal.all
  end

  def filter
    #filter_by_location
    filter_by_category
    @meals
  end


  private

  def filter_by_category
   if @params[:categories] != nil && @params[:categories].size != 0 && !@params[:categories].include?("all")
     @meals = @meals.joins(:category).where("categories.name IN (?)", @params[:categories])
   end
  end

  def filter_by_location
    if @params[:query].present?
     @meals = @meals.search(@params[:query][:location]) if @params[:query][:location].present?
    else
      @meals
    end
  end
end



