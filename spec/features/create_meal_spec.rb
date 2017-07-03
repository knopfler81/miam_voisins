require "rails_helper"
require "spec_helper"


describe 'creating a meal', js: true do

  before (:each) do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    FactoryGirl.create_list(:category, 6)
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
    visit new_meal_path
    fill_in 'Le nom de ton repas', with: "Poulet au cury"
    fill_in 'Nombre de parts', with: 3
    fill_in 'Prix/part', with: 5
    fill_in 'Où venir chercher', with: "Lyon"
    click_link('Ajouter un ingrédient')
    find('.nested-fields:nth-child(1)').fill_in "Ajouter un ingredient", with: "Poulet"
    click_link('Ajouter un ingrédient')
    find('.nested-fields:nth-child(2)').fill_in "Ajouter un ingredient", with: "Cury"
    select 'Yummy', from: "Séléctionnez une catégorie"
    select_date(:availability, with: "2017/12/12")
    expect(page).to have_selector("img[src=#{path}]")
    click_link "Valider"

    expect(page).to have_content('Repas créé avec succès!')

  end


end
