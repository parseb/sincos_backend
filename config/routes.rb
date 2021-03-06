Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/', to: 'sessions#home'

post '/', to: 'sessions#uauth'

get 'insession', to: 'insession#started'

post 'joins', to: 'insession#joins' #as: 'joins_path'

resources :sessions
resources :tasks

#API

namespace :api, defaults: { format: :json }, :controller => 'insession' do
  post 'joins', action: 'apijoins'
  post 'act',  action: 'sessionaction'
  get 'data',  action: 'data'
  post 'endsession', action: 'endssession'
end


end
