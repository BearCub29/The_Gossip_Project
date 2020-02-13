class UserController < ApplicationController
  def new
    @users = User.all
    @user = User.new
  end
  def create  
    
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name],description: params[:description],email: params[:email],age: params[:age],password: params[:password],city_id: 151)    # avec xxx qui sont les données obtenues à partir du formulaire
      if @user.save # essaie de sauvegarder en base @gossip
        redirect_to home_index_path# si ça marche, il redirige vers la page d'index du site
      else
        render new_user_path# sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
  end
  def show
  @gossips = Gossip.all
  @users = User.all
  @cities = City.all
  end

end