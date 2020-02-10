class IndexController < ApplicationController
  def home
  puts "Welcome home"
  @gossips = Gossip.all
  @users = User.all
  end

end