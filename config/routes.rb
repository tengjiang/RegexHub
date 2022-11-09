RegexHub::Application.routes.draw do
  
 
  resources :regexes # all the CRUD operations
  root :to => redirect('/regexes')

  get '/register', to: 'users#new'
  resources :users, only: [:create]

  resources :likes, only: [:create, :destroy]
  
end

