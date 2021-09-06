class CurrentNews < ApplicationRecord
  belongs_to :category
  #to be sure there is no duplicated current news
  validates :id_news,
  presence: true,
  uniqueness: true
  # even we have default value in config file for all paginations file
  # we can set a specific value for a specific module
  paginates_per 25
  scope :with_published_ASC, -> { order('published ASC') }

  def self.get_current_news_by_published
    CurrentNews.group_by_day(:published).count
  end

  def self.get_data_for_category_entire_time(id)
    CurrentNews.where(category_id: id).group_by_day(:published).count
  end

  def self.get_data_for_category_prev_week(id)
    chart_date = [];
    time = Time.new
    #cuz we need 7 days before today, we will got the start day by going in past 6 days
    time = time.prev_day(day = 6) #and then we will go to the next day every loop step
    for i in 1..7
      start_time = time.beginning_of_day().advance(hours: 3)
      end_time = time.end_of_day().advance(hours: 3)
      search_results = CurrentNews.where(category_id: id)
      .where(published: start_time...end_time).count
      # add to the beginning of array
      #We push the name of the day 'time.strftime('%A')' and category count in that day
      chart_date.push([time.strftime('%A'), search_results])
      #and then we will go to the next day every loop step
      time = time.next_day(day = 1)
    end
    return chart_date
  end
end
