Rails.application.routes.draw do
  root "static_pages#home"

  namespace :manager do
    root "static_pages#index"
  end
end
