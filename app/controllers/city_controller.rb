class CityController < ApplicationController
  def show
  @gossips = Gossip.all
  @users = User.all
  @cities = City.all
  end
end