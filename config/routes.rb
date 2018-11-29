Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # root :controller => 'index', :action => 'index'

  root   'home#index'
  get    'auth'            => 'home#auth'
  
  # Get login token from Knock
  post   'user_token'      => 'user_token#create'
  
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'



  get '/coins/total' => 'coins#total_value'

  # resources :coins, only: [:index, :show, :create, :destroy]

  get '/coins' => 'coins#index'
  get '/coins/:id' => 'coins#show'
  put '/coins/:id' => 'coins#update'

  post '/coins/:id' => 'coins#coin_updated'
  post '/coins' => 'coins#create'

  delete '/coins/:id' => 'coins#delete'

  get '/transactions' => "transactions#see_all"

  post '/transactions' => 'transactions#create'

  # resources :transactions, only: [:index, :show, :create]
end
