class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    PrepareCurrentNewsTable.new().prepare_news_table()
  end
end