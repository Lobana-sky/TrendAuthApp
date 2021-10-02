class PersistSingleCurrentNewsToDataBaseJob < ApplicationJob
  queue_as :default

  def perform(new_news)
    current_news = CurrentNews.new(new_news)
    current_news.save!
  end
end
