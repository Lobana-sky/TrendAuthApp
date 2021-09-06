class ChartDataController < ApplicationController
  def index
    @search_results_seven_days = get_chart_data()
    # @category_name_search = Category.find(params[:search_word]["id"].to_i).category_name
    @category_id_search = Category.find(params[:search_word]["id"].to_i)
  end

  def get_chart_data
    chart_date = [];
    time = Time.new
    time = time.prev_day(day = 6)
    for i in 1..7
      start_time = time.beginning_of_day().advance(hours: 3)
      end_time = time.end_of_day().advance(hours: 3)
      search_results = CurrentNews.where(category_id: params[:search_word]["id"].to_i)
      .where(published: start_time...end_time).count
        # add to the beginning of array
      chart_date.push([time.strftime('%A'), search_results])
      time = time.next_day(day = 1)
    end
  return chart_date
  end
end
