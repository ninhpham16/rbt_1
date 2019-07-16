Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "manager/sessions"
  }, path: :manager

  devise_for :users, skip: :all
    as :user do
      get "/login", to: "users/sessions#new", :as => :new_user_session
      post "/login", to: "users/sessions#create", :as => :user_session
      delete "/logout", to: "users/sessions#destroy", :as => :destroy_user_session
      get "/register", to: "users/registrations#new", :as => :new_user_registration
      post "/register", to: "users/registrations#create", :as => :user_registration
  end

  root "static_pages#home"
  get "/schedule", to: "static_pages#schedule"

  namespace :manager do
    root "static_pages#index"
    resources :categories
    resources :users
    resources :cities
    resources :movies
    resources :rooms
    resources :theaters
  end  

  resources :movies, only: [:show, :index]
  resources :cities, only: [:index, :show]
  resources :users, only: [:show, :edit, :update]
  resources :theaters, only: [:show]
end
