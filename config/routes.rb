Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  # Add direct OmniAuth route
  devise_scope :user do
    get 'users/auth/github/callback' => 'users/omniauth_callbacks#github'
  end

  # Dashboard routes
  get 'dashboard', to: 'dashboard#index', as: :dashboard
  
  # Set different root paths for authenticated and non-authenticated users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end
  
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
