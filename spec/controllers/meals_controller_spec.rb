require 'rails_helper'


describe MealsController do

render_views

  describe "GET show/:id" do
    it "should show meal" do
      meal = create(:meal)
      get :show, id: meal.id
    end
  end

  describe "POST #create" do
    it "creates new meal" do

      meal= create(:meal)
      expect(Meal.count).to eq(1)
    end
  end

  # describe "GET #index" do
  #   it "populates an array of meals" do

  #     meal = FactoryGirl.create(:meal)
  #     get :index
  #     expect(assigns(:meals)).to eq([meal])
  #   end

  #   it "renders the :index view" do

  #     get :index
  #     expect(response).to render_template("index")
  #   end

  # end


  # describe "PATCH #destroy" do
  #  # it "deletes the meal" do
  #  #    expect{
  #  #      delete :destroy, id: @meal
  #  #    }.to change(Meal, :count).by(-1)
  #  #  end

  # end
end
