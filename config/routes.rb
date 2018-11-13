Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :controller => 'index', :action => 'index'

  get '/coins' => 'coins#see_all'
  get '/coins/:id' => 'coins#see_one'
  post '/coins' => 'coins#create'
end
