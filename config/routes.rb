Rails.application.routes.draw do
  
  get '/', to: 'sessions#new', as: 'root'
  
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new', as:'signup'
  post '/signup', to: 'users#create'
  
  resources :users
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
