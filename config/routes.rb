Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/states/', to: 'states#index'
  get '/states/:id', to: 'states#show'
  get '/states/:id/cities', to: 'state_cities#index'
  get '/cities', to: 'cities#index'
  get '/cities/:id', to: 'cities#show'
end
