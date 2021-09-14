class CurrentNewsController < ApplicationController
  def index 
    @categories = Category.find_each
    @categories_hash = Category.get_categories_as_hash(@categories)

    @current_news = get_current_news()
  end

  private

    def category_id()
      params[:category]["id"].to_i
    end

    def published_date()
      Date.civil(params[:published][:"date(1i)"].to_i,
        params[:published][:"date(2i)"].to_i,
        params[:published][:"date(3i)"].to_i) 
    end

    def search_options()
      @option = "all options"
      if params[:select_category] == "1" && params[:select_published_date] == "1"
        @option = "both options"
      elsif params[:select_published_date] == "1"
          @option = "date option"
      elsif params[:select_category] == "1"
        @option = "category option"
      end
    end

    def search_current_news_methods()
      case @option
      when "both options" # Published & category : search by published & category
        CurrentNews.get_current_news_by_category_in_date(category_id(), published_date())
      when "date option" # Published : search by published
        CurrentNews.get_current_news_in_date(published_date())
      when "category option" # Category : search by category
        CurrentNews.get_current_news_by_category(category_id())
      else # All current news
        CurrentNews
      end
    end

    def get_current_news()
      search_options()
      search_current_news_methods().with_published_DESC.page params[:page]
    #.page params[:page] for kaminari pagination
    end
end
