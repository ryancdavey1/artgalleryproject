Rails.application.routes.draw do

  
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #get '/artworks', to: 'artworks#index', as: 'artworks'
  #get 
  get '/artworks/:id/bids/new' => 'bids#new'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :bids

  resources :artworks do
    resources :bids
  end
  
  #resources :sessions
  resources :users do
    resources :bids
  end
end
