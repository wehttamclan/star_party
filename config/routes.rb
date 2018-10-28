Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/forecast', to: 'forecast#index'

  get "/party_search", to: 'party_search#index'

  resources :parties, only: [:new, :create, :show]

end
