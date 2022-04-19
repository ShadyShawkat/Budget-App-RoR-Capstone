Rails.application.routes.draw do
  resources :payments
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root 'devise/sessions#new', as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
end
