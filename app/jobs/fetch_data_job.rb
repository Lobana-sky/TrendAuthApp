class FetchDataJob < ApplicationJob
  queue_as :default

  def perform
    results = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    mapped_latest_news = CurrentNewsResponseProccessingAndMapping.new(results).call()
    persist_to_data_base(mapped_latest_news)
  end

  private

    def persist_to_data_base(mapped_latest_news)
      mapped_latest_news.each do |new_news|
        PersistSingleCurrentNewsToDataBaseJob.perform_later(new_news)
      end
    end
end