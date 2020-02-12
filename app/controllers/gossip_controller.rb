class GossipController < ApplicationController
  def new
    @users = User.all
    @gossip = Gossip.new
  end
  def create
      @anonymous = User.create(first_name: "Jean", last_name: "Huss", description: "hgckshgkgz", email: "jean@huss.com",age: 99,city_id: 143)
      @gossip = Gossip.new(title: params[:title], content: params[:content],user_id: @anonymous.id ) # avec xxx qui sont les données obtenues à partir du formulaire
      if @gossip.save # essaie de sauvegarder en base @gossip
        redirect_to '/home'# si ça marche, il redirige vers la page d'index du site
      else
        render '/gossip/new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end
 
  def show
    @users = User.all
    @jean = Gossip.find(params[:id])
    @gossips = Gossip.all
    @comments = Comment.all
  end

  def edit 
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_update = params.require(:gossip).permit(:title, :content)
  if @gossip.update(gossip_update)
    redirect_to gossip_path(params[:id])
  else
    render :edit
  end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to home_index_path

  end

end