require "rails_helper"

describe "processing an order" do
  before (:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it "shows the chosen meal" do
    meal = create(:meal, menu_name: "Poulet au cury")

    visit meal_path(meal)

    expect(page).to have_content("Poulet au cury")
  end

  it "creates the first step of the order" do
    meal = create(:meal, menu_name: "Poulet au cury")
    order = create(:order, quantity: 2, message: "Yolo")

    visit meal_path(meal)
    select(2,  from: "Parts")
    fill_in "Message", with: "Yolo"

    click_on('Valider')

    expect(page).to have_content("Récapitulatif de votre commande")
  end

  it "shows the order summary" do
    order = create(:order, quantity: 2, amount: 8)

    visit order_path(order)
    expect(page).to have_content("Récapitulatif de votre commande")
  end
end
