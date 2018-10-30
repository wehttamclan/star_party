Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      namespace :parties do
        get '/find_all', to: 'search#index' #by zip
      end
      scope module: 'parties' do
        resources :parties, only: [:index, :show]
      end
    end
  end

  get '/forecast', to: 'forecast#index'

  get "/party_search", to: 'party_search#index'

  resources :parties, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'
  get '/text', to: 'texts#create'

  resources :users, only: [:new, :create]

end
