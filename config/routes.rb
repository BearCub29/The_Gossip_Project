Rails.application.routes.draw do
  get '/team' , to: 'team#info_team'
  get '/contact', to: 'contact#info_contact'
  get '/welcome/:first_name', to: 'welcome#welcome_message'
  get '/', to: 'index#home', as: "home_page"
  get '/gossip/:id', to: 'page_gossip#show_gossip', as: "page_gossip"
  get 'gossip/:id/author/:author', to: 'page_author#show_author', as: "page_author"
end
