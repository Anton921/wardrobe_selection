Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out', to: 'devise/sessions#destroy'     
  end

  root 'products#index'

  get 'search', to: 'products#search'
  get 'show_likes', to: 'likes#show_likes'

  resources :styles

  resources :products do
    resources :comments
    resources :likes
  end

  resources :categories
  resources :likes
end
