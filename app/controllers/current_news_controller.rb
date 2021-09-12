class CurrentNewsController < ApplicationController
  def index 
    @current_news = CurrentNews.with_published_ASC.page params[:page]
    @categories = Category.find_each
    @categories_hash = Category.get_categories_as_hash(@categories)

  end

  # private

  #   def get_category_id()
  #     params[:category]["id"].to_i
  #   end

  #   def get_category_name(id)
  #     Category.find(id).category_name
  #   end
end
