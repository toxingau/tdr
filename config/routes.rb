Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "static_pages#home"

  resources :users
  resources :locations, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  namespace :admin do
    root "static_pages#home"
    resources :locations
    resources :users, only: [:index, :destroy, :show]
  end
end
