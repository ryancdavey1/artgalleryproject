Rails.application.routes.draw do

  
  root 'sessions#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  #get '/artworks', to: 'artworks#index', as: 'artworks'
  #get 
  
  resources :artworks do 
    resources :bids
  end
  resources :sessions
  resources :users
end
