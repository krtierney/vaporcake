Rails.application.routes.draw do
  resources :releases
  devise_for :users
  root "questions#new"

  resources :questions do 
    collection do
      get "bulk_edit", to: "questions#edit" 
      post "bulk_update", to: "questions#bulk_update"
    end
  end
  resources :users
end
