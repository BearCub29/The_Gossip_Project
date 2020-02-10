class PageGossipController < ApplicationController
  def show_gossip
  @gossips = Gossip.all
  @users = User.all
  end

end