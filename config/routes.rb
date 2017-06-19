Rails.application.routes.draw do

  root to: 'meals#index'


  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: {
    registrations: "registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show]

  resources :meals do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
