Rails.application.routes.draw do
  resources :livro_leitors
  devise_for :users
  resources :autors
  resources :users
  resources :editoras do 
    collection { get :pesquisa }
  end
  resources :leitors do 
    collection { get :pesquisa }
  end
  resources :livros do 
    collection { get :pesquisa }
  end
  resources :categores do 
    collection { get :pesquisa }
  end
  root to: "users#index"
end
