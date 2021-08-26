class FetchDataJob < ApplicationJob
  queue_as :default

  def persist_to_data_base(mapped_latest_news)
    mapped_latest_news.each do |new_news|
    CreateCurrentNews.new(current_news_params: new_news).call()
    end
  end

  def perform(*args)
    results = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    if results[:payload] && results[:success]
      mapped_latest_news = ResponseMapping.new(results[:payload]).call()
      persist_to_data_base(mapped_latest_news)
    end
  end
end