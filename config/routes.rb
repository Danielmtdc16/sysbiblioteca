Rails.application.routes.draw do
  devise_for :users
  resources :leitors
  resources :categores
  resources :editoras
  resources :autors
  resources :users
  
  root to: "users#index"
end
