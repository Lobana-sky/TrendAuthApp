class ChartDataController < ApplicationController
  def index
    @current_news = CurrentNews.find_each
    @categories = Category.find_each

    # Full chart all current news group by published date
    @current_news_by_published = 
      ChartData.get_current_news_group_by_published()

    # Trend chart seacrh by user (search word and no of days)
    if params[:trend_text].present?
      @trend_data = 
      ChartData.get_trend_data(params[:trend_text], params[:days_no].to_i)
      @search_word = params[:trend_text]#pass in to view
      @show_trend_chart = true
    else
      @show_trend_chart = false
    end

    # Category chart : search by category
    if params[:category].present? && get_category_name(get_category_id()) != "NONE"
      category_id = get_category_id()
      @category_name = get_category_name(category_id)#pass in to view

      @current_news_by_category = 
      ChartData.get_current_news_by_category(category_id)
      @show_category_chart = true
    else
      @show_category_chart = false
    end

  end

  private

    def get_category_id()
      params[:category]["id"].to_i
    end

    def get_category_name(id)
      Category.find(id).category_name
    end
    
end
