Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out', to: 'devise/sessions#destroy'     
  end

  root 'products#index'

  get 'search', to: 'products#search'

  resources :styles

  resources :products

  resources :categories
end
