Rails.application.routes.draw do

  
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #get '/artworks', to: 'artworks#index', as: 'artworks'
  #get 
  get '/artworks/:id/bids/new' => 'bids#new'
  resources :artworks 
  resources :bids
   
  resources :sessions
  resources :users
end
