class GossipController < ApplicationController
  def new
  
  end
  def create
      @anonymous = User.create(first_name: "Jean", last_name: "Huss", description: "hgckshgkgz", email: "jean@huss.com",age: 99,city_id: 140)
      @gossip = Gossip.new(title: params[:title], content: params[:content],user_id: @anonymous.id ) # avec xxx qui sont les données obtenues à partir du formulaire
      if @gossip.save # essaie de sauvegarder en base @gossip
        redirect_to '/home'# si ça marche, il redirige vers la page d'index du site
      else
        render '/gossip/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end
 
  def show
    @users = User.all
    @cities = City.all
  end

end