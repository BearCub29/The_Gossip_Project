class GossipController < ApplicationController
  before_action :authenticate_user, only: [:new, :show]

  def new
    @gossip = Gossip.new
  end
  def create
      @gossip = Gossip.new(title: params[:title], content: params[:content],user_id: current_user.id ) # avec xxx qui sont les données obtenues à partir du formulaire
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
    @city = City.find(@users.find(@jean.user_id).city_id)
    
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

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end