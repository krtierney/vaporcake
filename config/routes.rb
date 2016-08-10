Rails.application.routes.draw do

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

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
