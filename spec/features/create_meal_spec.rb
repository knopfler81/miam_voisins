require "rails_helper"
require "spec_helper"


describe 'creating a meal', js: true do
  user = FactoryGirl.create(:user)
  login_as(user, :scope => :user)

  it "shows the meals form" do
    visit new_meal_path

    expect(page).to have_content("Crée le miam que tu veux partager")
  end

end
