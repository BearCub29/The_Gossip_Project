class CityController < ApplicationController
  def show
  
  @gossips = Gossip.all
  @users = User.all
  @cities = City.all
  @users = User.all
  @user = User.find(params[:format])
  @gossip = Gossip.find(params[:id])
  @gossips = Gossip.all
  @comments = Comment.all
  @city = City.find(@users.find(@gossip.user_id).city_id)
  end
end