class WelcomeController < ApplicationController
  def welcome_message
    @user = params["first_name"]
  end

end