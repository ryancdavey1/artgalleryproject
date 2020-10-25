Rails.application.routes.draw do

  resources :bids
  resources :artworks
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #get '/artworks', to: 'artworks#index', as: 'artworks'
  resources :sessions
  resources :users
end
