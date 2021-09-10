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
  
  
  
  # Charts Data
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

  def self.get_current_news_by_category(id)
    CurrentNews.where(category_id: id).group_by_day(:published).count
  end

end
