class ChartDataController < ApplicationController
  def index
    #chart for all categories
    @categories = Category.find_each

    # Full chart all current news group by published date
    @current_news_by_published = 
      ChartData.get_current_news_group_by_published()

    # Trend chart seacrh by user (search word and no of days)
    @show_trend_chart = false
    if trend_text().present?
      @trend_data = 
        ChartData.get_trend_data(trend_text(), no_of_days())
      @search_word = trend_text()#pass in to view
      @show_trend_chart = true
    end

  end

  private

    def trend_text
      params[:trend_text]
    end

    def no_of_days
      params[:days_no].to_i
    end

end
