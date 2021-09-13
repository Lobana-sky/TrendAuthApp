class CurrentNewsController < ApplicationController
  def index 
    @categories = Category.find_each
    @categories_hash = Category.get_categories_as_hash(@categories)

    search_options()
    @current_news = search_methods()

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
      else 
        if params[:select_published_date] == "1"
          @option = "date option"
        end
      end
    end

    def search_methods()
      case @option
      when "both options" # Published & category : search by published & category
        CurrentNews.get_current_news_by_category_in_date(category_id(), published_date()).page params[:page]
      when "date option" # Published : search by published
        CurrentNews.get_current_news_in_date(published_date()).page params[:page]
      when "all options" # All current news
        CurrentNews.with_published_ASC.page params[:page]
      else # Category : search by category
        CurrentNews.get_current_news_by_category(category_id()).page params[:page]
      end
    end
end
