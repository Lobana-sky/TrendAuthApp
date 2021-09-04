class CurrentNewsController < ApplicationController
  def index 
    @current_news = CurrentNews.with_published_ASC.page params[:page]
    categories = Category.find_each
    @categories = GetCategoriesAsHash.new(categories).call()
  end
end
