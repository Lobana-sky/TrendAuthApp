class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    results = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    mapped_latest_news = ResponseMapping.new(results).call()
    persist_to_data_base(mapped_latest_news)
  end

  private

    def persist_to_data_base(mapped_latest_news)
      mapped_latest_news.each do |new_news|
      current_news = CurrentNews.new(new_news)
      current_news.save
      end
    end
end