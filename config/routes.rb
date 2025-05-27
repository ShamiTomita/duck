Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  # Add direct OmniAuth route
  devise_scope :user do
    get 'users/auth/github/callback' => 'users/omniauth_callbacks#github'
  end

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
