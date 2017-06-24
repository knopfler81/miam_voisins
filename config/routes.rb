Rails.application.routes.draw do


  root to: 'pages#home'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
  controllers: {  registrations: "registrations",
                  omniauth_callbacks: 'users/omniauth_callbacks'
                }

  resources :users, only: [:show]

  resources :meals do
    resources :orders, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

end
