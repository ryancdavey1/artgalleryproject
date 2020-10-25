Rails.application.routes.draw do

  resources :bids
  resources :artworks
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users
end
