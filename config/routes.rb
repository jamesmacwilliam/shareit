Shareit::Application.routes.draw do
  root :to => "home#index"
  #devise_for :users, controllers: {registrations: "registrations"}
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :users
end
