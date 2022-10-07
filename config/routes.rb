Rails.application.routes.draw do
  resources :configuracoes_sistemas
  resources :livro_leitors
  devise_for :users
  resources :users
  resources :editoras do 
    collection { get :pesquisa }
  end
  resources :autors do 
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
