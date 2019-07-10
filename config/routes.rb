Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions: "manager/sessions"
}, path: :manager


  namespace :manager do
    root "static_pages#index"
    resources :categories
    resources :users
  end  
  resources :movies, only: [:show]
end
