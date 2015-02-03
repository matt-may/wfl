Rails.application.routes.draw do
  resources :recommendations

  resources :restaurants

  resources :ratings

  devise_for :users

  root to: 'recommendations#show'
end