Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'sessions/login'
  post'/login'          , to: 'sessions#create'
  delete '/logout'      , to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
