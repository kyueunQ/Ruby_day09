Rails.application.routes.draw do
  
  root 'board#index'
  
  get '/boards' => 'board#index'

  get '/board/new' => 'board#new'
  
  get '/board/:id' => "board#show"

  post '/boards' => 'board#create'
  
  get '/board/:id/edit' => 'board#edit'
  
  put '/board/:id' => 'board#update'
  
  patch '/board/:id' => 'board#update'
  
  delete '/board/:id' => 'board#destroy'
  
  
  # User 
  get '/users' => 'user#index'
  get '/user/:id' => 'user#show'
    
  get '/sign_up' => 'user#new'
  get '/sign_in' => 'user#sign_in'
  get '/logout' => 'user#logout'
  post '/sign_in' => 'user#login'
  post '/users' => 'user#create'
  
  get '/user/:id/edit' => 'user#edit'
  put '/user/:id' => 'user#update'
  patch '/user/:id' => 'user#update'
  
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
