Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/', to: 'sessions#home'

post '/', to: 'sessions#uauth'

get '/insession', to: 'insession#started'

resources :sessions
resources :tasks

end
