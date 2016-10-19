Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root "static_pages#home"

  resources :users, only: [:index, :show]
  resources :locations, only: [:index, :show]
  resources :reviews, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  namespace :admin do
    root "static_pages#home"
    resources :locations
    resources :users, only: [:index, :destroy, :show]
    resources :categories
    resources :images, only: [:new, :create]
  end
end
