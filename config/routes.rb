Rails.application.routes.draw do
  resources :goal_records
  resources :donates
  resources :acts
  resources :products
  resources :goals
  devise_for :users
  
  get 'act/request', to: 'acts#req'
  get 'product/request', to: 'products#req'
  get 'donate/request', to: 'donates#req'
  root to: 'home#index'
end
