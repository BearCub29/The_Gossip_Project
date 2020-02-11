Rails.application.routes.draw do
  get '/team', to: 'info#show_team'
  get '/contact', to: 'info#show_contact'
  resources :gossip, only: [:new, :create, :show]
  resources :home, only: [:index]
  resources :welcome , only: [:show]
  resources :user , only: [:show]
end
