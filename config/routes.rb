Rails.application.routes.draw do
  resources :leitors
  resources :categores
  resources :editoras
  resources :autors
  resources :users
  
  root to: "users#index"
end
