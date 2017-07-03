require "rails_helper"
require "spec_helper"


describe 'creating a meal', js: true do

  before (:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    #FactoryGirl.create_list(:category, 6)
  end

  it "shows the landind page " do
    visit '/'
    expect(page).to have_content("Vos voisins peuvent remplir votre assiette")
  end

  it "open the meal form after clicking 'propose' button" do
    visit '/'
    click_link('Propose')
    expect(page).to have_content("Crée le miam que tu veux partager")
  end

  it "success when the form is correctly filled in" do
    skip
    FactoryGirl.create_list(:category, 6)
    visit new_meal_path
    fill_in 'Le nom de ton repas', with: "Poulet au cury"
    fill_in 'Nombre de parts', with: 3
    fill_in 'Prix/part', with: 5
    fill_in 'Où venir chercher', with: "Lyon"
    click_link('Ajouter un ingrédient')
    find('.nested-fields:nth-child(1)').fill_in "Ajouter un ingredient", with: "Poulet"
    click_link('Ajouter un ingrédient')
    find('.nested-fields:nth-child(2)').fill_in "Ajouter un ingredient", with: "Cury"
    within('.meal-category') do
      select 6
    end
    within('.meal-date') do
      select "12 Juillet 2017"
    end
    save_and_open_screenshot
    expect(page).to have_selector("img[src=#{path}]")
    click_link "VALIDER"

    save_and_open_screenshot
    expect(page).to have_content('Repas créé avec succès!')

  end
end
