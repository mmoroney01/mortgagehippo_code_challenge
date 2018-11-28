Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :controller => 'index', :action => 'index'

  get '/coins/total' => 'coins#total_value'
  get '/coins' => 'coins#index'
  get '/coins/:id' => 'coins#show'
  put '/coins/:id' => 'coins#update'

  post '/coins/:id' => 'coins#coin_updated'
  post '/coins' => 'coins#create'

  delete '/coins/:id' => 'coins#delete'

  get '/transactions' => "transactions#see_all"

  post '/transactions' => 'transactions#create'

  get '/apiusers/:apiuser_id/transactions' => "transactions#see_all_transactions_one_user"
end
