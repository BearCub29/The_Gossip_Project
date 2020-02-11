class HomeController < ApplicationController
  def index
  puts "Welcome home"
  @gossips = Gossip.all
  @users = User.all
  end

end