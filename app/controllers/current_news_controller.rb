class CurrentNewsController < ApplicationController
  def index 
    @current_news = CurrentNews.with_published_ASC.page params[:page]
    categories = Category.find_each
    @categories = Category.get_categories_as_hash(categories)
  end
end
