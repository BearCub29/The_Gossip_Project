class PageAuthorController < ApplicationController
  def show_author
  @users = User.all
  @cities = City.all
  end

end