class ChartDataController < ApplicationController
  def index
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

  end

end
