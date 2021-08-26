class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    results = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    if results[:payload] && results[:success]
      PersistToDataBase.new(results[:payload]).create_news_and_save()
   end
  end
end