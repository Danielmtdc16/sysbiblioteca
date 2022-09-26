Rails.application.routes.draw do
  resources :livro_leitors
  resources :livros
  devise_for :users
  resources :leitors
  resources :categores
  resources :editoras
  resources :autors
  resources :users
  
  root to: "users#index"
end
