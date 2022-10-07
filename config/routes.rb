Rails.application.routes.draw do
  resources :livro_leitors
  resources :livros
  devise_for :users
  resources :leitors
  resources :categores
  resources :autors
  resources :users
  resources :editoras do 
    collection { get :pesquisa }
  end

  root to: "users#index"
end
