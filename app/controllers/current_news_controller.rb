class CurrentNewsController < ApplicationController
  def index 
    @current_news = CurrentNews.page params[:page]
    @categories = Category.find_each
  end
end
