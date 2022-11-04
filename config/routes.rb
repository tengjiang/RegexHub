RegexHub::Application.routes.draw do
  resources :regexes # all the CRUD operations
  
  root :to => redirect('/regexes')

end

