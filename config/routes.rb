Rails.application.routes.draw do
  root to: 'recipes#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :recipes do
    resources :doses, only: [:new, :create]
    resources :ratings, only: :create
  end
end
