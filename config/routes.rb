Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/forecast', to: 'forecast#index'

  get "/party_search", to: 'party_search#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'

  resources :users, only: [:new, :create]

  resources :parties, only: [:new, :create]

end
