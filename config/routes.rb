Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :controller => 'index', :action => 'index'

  get '/coins' => 'coins#see_all'
  get '/coins/:id' => 'coins#see_one'
  get '/coins/:id/edit' => 'coins#update_one'

  post '/coins/:id' => 'coins#coin_updated'
  post '/coins' => 'coins#create'

  delete '/coins/:id' => 'coins#delete_one'
end
