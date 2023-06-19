Rails.application.routes.draw do
  root "users#index"
  # root 'pages#blog'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
