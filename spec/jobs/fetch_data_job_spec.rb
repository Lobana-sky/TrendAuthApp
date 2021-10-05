require "rails_helper"

RSpec.describe FetchDataJob, type: :job do
# Checking job class name
  it "matches job class name FetchDataJob" do
    ActiveJob::Base.queue_adapter = :test
    FetchDataJob.perform_later
    expect(FetchDataJob).to have_been_enqueued
  end
# Checking job queue name
  it "enqueued job in 'default' queue" do
    ActiveJob::Base.queue_adapter = :test
    FetchDataJob.perform_later
    expect(FetchDataJob).to have_been_enqueued.on_queue("default")
  end
# Checking job enqueued with wait until 04:00 am and pm
  it "job enqueued with no wait" do
    ActiveJob::Base.queue_adapter = :test
    FetchDataJob.set(:wait_until => Time.zone.today.beginning_of_day).perform_later
    expect(FetchDataJob).to have_been_enqueued.at(Time.zone.today.beginning_of_day)
  end
# Checking passed arguments to job
  it "passed new_news as hash argument successfully" do
    ActiveJob::Base.queue_adapter = :test
    new_news = {
          id_news: "a5467dd9-95d3-4fd1-bf65-551424643527",
          title: "American...",
          description: "Currently...",
          url: "https://kwwl...",
          author: "Meg Swanson",
          image: "https://qui...",
          language: "en",
          published: "2021-09-01 23:19:09.000000000 +0000",
          category_id: 617
        }
    FetchDataJob.perform_later(new_news)
    expect(FetchDataJob).to(
      have_been_enqueued.with(new_news)
    )
  end

end