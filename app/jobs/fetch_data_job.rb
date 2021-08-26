class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    latest_news = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    PersistToDataBase.new(latest_news).create_news_and_save()
  end
end