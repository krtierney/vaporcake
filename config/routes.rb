Rails.application.routes.draw do
  devise_for :users
  root "questions#new"

  resources :questions
  resources :users
end
