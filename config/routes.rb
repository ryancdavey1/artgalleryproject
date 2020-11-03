Rails.application.routes.draw do

  
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/artworks/:id/bids/new' => 'bids#new'
  get '/auth/github/callback' => 'sessions#github'
  get 'artworks/most_bids' => 'artworks#most_bids'

  resources :bids

  resources :artworks do
    resources :bids
  end
  
  resources :sessions
  resources :users do
    resources :bids
  end
end
