Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  root   'home#index'
  get    'auth'            => 'home#auth'
    
  post   'user_token'      => 'user_token#create'
  
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'
  
  get    '/users/transactions' => 'users#transactions'

  get '/coins/total' => 'coins#total_value'
  resources :coins, only: [:index, :show, :create, :update, :destroy]

  post '/transactions' => 'transactions#create'
  resources :transactions, only: [:index, :show, :create]
end