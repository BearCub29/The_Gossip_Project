Rails.application.routes.draw do
  get '/team', to: 'info#show_team'
  get '/contact', to: 'info#show_contact'
  resources :home, only: [:index]
  resources :welcome , only: [:show]
  resources :user 
  resources :city
  resources :gossip do
    resources :comment
  end
  resources :sessions, only: [:new, :create, :destroy]
end
