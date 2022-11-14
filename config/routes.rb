RegexHub::Application.routes.draw do
  resources :regexes # all the CRUD operations
  root :to => redirect('/regexes')

  resources :users

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'


end

