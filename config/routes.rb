RegexHub::Application.routes.draw do
  resources :regexes # all the CRUD operations
  # map '/' to be a redirect to '/movies'
  # root :to => redirect('/movies')
  # get '/movies/:id/director', to: 'movies#search_directors', as: 'search_directors'
  
  root :to => redirect('/regexes')
  # get '/regexes/:id/:input_regex', to: 'movies#search_directors', as: 'search_directors'

end

