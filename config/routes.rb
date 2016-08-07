Rails.application.routes.draw do
  get 'statics/homepage'

  devise_for :users

  root "statics#homepage"

  resources :questions do 
    collection do
      get "bulk_edit", to: "questions#edit" 
      post "bulk_update", to: "questions#bulk_update"
    end
  end
  resources :users
  resources :releases
end
