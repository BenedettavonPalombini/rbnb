Rails.application.routes.draw do
  get 'bookmarks/new'
  devise_for :users
  root to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :conversations, only: [:show, :index] do
    resources :messages, only: :create
  end

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, except: [:destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
