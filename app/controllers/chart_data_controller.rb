class ChartDataController < ApplicationController
  def index
    # Full chart all current news group by published date
    @current_news_by_published = 
      CurrentNews.get_current_news_group_by_published()

    # Trend chart seacrh by user (search word and no of days)
    if params[:query].present?
      @trend_data = 
        CurrentNews.get_trend_data(params[:query], params[:days_no].to_i)
      @search_word = params[:query]#pass in to view
    end

    # Category chart : search by category
    if params[:search_word].present?
      category_id = get_category_id()
      @category_name = get_category_name(category_id)#pass in to view

      @current_news_by_category_in_entire_time = 
      CurrentNews.get_current_news_by_category(category_id)
    end

  end

  private

    def get_category_id()
      params[:search_word]["id"].to_i
    end

    def get_category_name(id)
      Category.find(id).category_name
    end
    
end
