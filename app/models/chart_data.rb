class ChartData

  def self.get_current_news_group_by_published
    CurrentNews.group_by_week(:published).count
  end

  def self.get_trend_data(search_word, no_of_days)
    chart_date = [];
    time = Time.new
    #go to start date so time will be the start date
    time = time.prev_day(day = no_of_days - 1)
    (1..no_of_days).each do
      start_time = time.beginning_of_day()
      end_time = time.end_of_day()
      # prev two lines to get start time 2021-09-13 00:00:00 -----  2021-09-13 23:59:59
      #beginning_of_day() --> 2021-09-13 00:00:00 
      search_results = CurrentNews.where('title like ?', "%#{search_word}%")
      .or(CurrentNews.where('description like ?', "%#{search_word}%"))
      .where(published: start_time...end_time).count

      # add to the beginning of array then go to the next day
      chart_date.push([time.strftime("%F"), search_results])
      time = time.next_day(day = 1)
    end
    return chart_date
  end
  
end
  