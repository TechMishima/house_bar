Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'cocktails#index'

  resources :users, only: [:show]
  resources :cocktails do
    collection do
      get 'search'
    end
  end

end
