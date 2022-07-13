Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show'
  get '/states', to: 'states#index'
  get '/states/new', to: 'states#new'
  post '/states', to: 'states#create'
  get '/states/:id/edit', to: 'states#edit'
  patch '/states/:id', to: 'states#update'
  get '/states/:id', to: 'states#show'
  get '/states/:id/cities', to: 'state_cities#index'
  
end
