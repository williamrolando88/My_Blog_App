Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
      resources :comments
      resources :likes, only: [:create]
    end
  end
  
  namespace :api do
    devise_for :users
    resources :users, only: [:create, :index, :show] do
      resources :posts, only: [:index, :show] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
