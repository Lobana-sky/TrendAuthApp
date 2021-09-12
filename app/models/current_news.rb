class CurrentNews < ApplicationRecord
  belongs_to :category
  #to be sure there is no duplicated current news
  validates :id_news,
  presence: true,
  uniqueness: true
  # even we have default value in config file for all paginations file
  # we can set a specific value for a specific module
  paginates_per 20
  scope :with_published_ASC, -> { order('published ASC') }
  
  
  def self.get_current_news_by_category(id)
    CurrentNews.where(category_id: id)
  end

  def self.get_current_news_in_date(published_date)
    start_time = published_date.beginning_of_day().advance(hours: 3)
    end_time = published_date.end_of_day().advance(hours: 3)
    search_results = CurrentNews.where(published: start_time...end_time)
  end
end
