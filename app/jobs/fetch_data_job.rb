class FetchDataJob < ApplicationJob
  queue_as :default

  def perform
    results = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    new_latest_news = CurrentNewsResponseProccessingAndMapping.new(results).call()
    persist_to_data_base(new_latest_news)
  end

  private

    def persist_to_data_base(new_latest_news)
      new_latest_news.each do |new_news|
        PersistSingleCurrentNewsToDataBaseJob.perform_later(new_news) #hash argument
      end
    end
end