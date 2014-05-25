Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :frits
  resources :users
  resources :prompts
  resources :limits
  
  root 'pages#index'
  get '/show' => 'pages#show'

end
