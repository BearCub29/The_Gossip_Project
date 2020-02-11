class WelcomeController < ApplicationController
  def show
    @user = params["first_name"]
  end

end