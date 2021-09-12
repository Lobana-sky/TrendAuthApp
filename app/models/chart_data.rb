class ChartData

  def self.get_current_news_group_by_published
    CurrentNews.group_by_day(:published).count
  end

  def self.get_trend_data(search_word, no_of_days)
    chart_date = [];
    time = Time.new
    time = time.prev_day(day = no_of_days - 1)
    for i in 1..no_of_days
    start_time = time.beginning_of_day().advance(hours: 3)
    end_time = time.end_of_day().advance(hours: 3)
    search_results = CurrentNews.where('title like ?', "%#{search_word}%")
    .or(CurrentNews.where('description like ?', "%#{search_word}%"))
    .where(published: start_time...end_time).count

    # add to the beginning of array
    #We push the name of the day 'time.strftime('%A')' and category count in that day
    chart_date.push([time.strftime("%F"), search_results])
    time = time.next_day(day = 1)
    end
    return chart_date
  end
  
end
  