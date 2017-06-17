Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: {
    registrations: "registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'meals#index'

  resources :meals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
