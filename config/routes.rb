Rails.application.routes.draw do
  resources :configuracoes_sistemas
  
  resources :livro_leitors, :path => "livro_leitors" do
    collection do
       get "/relatorio"  => "livro_leitors#relatorio", :as => "relatorio"
       get "/relatorioreserva/:id"  => "livro_leitors#relatorioreserva", :as => "relatorioreserva" 
    end
  end
  
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
