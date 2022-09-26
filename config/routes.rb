Rails.application.routes.draw do
  resources :editoras
  resources :autors
  resources :users
  
  root to: "users#index"
end
