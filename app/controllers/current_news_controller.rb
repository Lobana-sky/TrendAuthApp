class CurrentNewsController < ApplicationController
  def index 
    @current_news = CurrentNews.with_published_ASC.page params[:page]
    @categories = Category.find_each
    @categories_hash = Category.get_categories_as_hash(@categories)

    # Category : search by category
    if params[:category].present?
      @current_news = 
      CurrentNews.get_current_news_by_category(get_category_id()).page params[:page]
    end

    if params[:published].present?
      published_date = 
        Date.civil(params[:published][:"date(1i)"].to_i,
        params[:published][:"date(2i)"].to_i,
        params[:published][:"date(3i)"].to_i) 
      @current_news = 
        CurrentNews.get_current_news_in_date(published_date).page params[:page]
    end
  end

  private

    def get_category_id()
      params[:category]["id"].to_i
    end

end
