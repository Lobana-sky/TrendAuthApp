class PagesController < ApplicationController
  def home
  end

  def index 
    @users = User.find_each
  end
end
