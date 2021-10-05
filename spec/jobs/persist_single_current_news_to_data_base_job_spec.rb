require "rails_helper"

RSpec.describe PersistSingleCurrentNewsToDataBaseJob, type: :job do
# Checking job class name
  it "matches job class name PersistSingleCurrentNewsToDataBaseJob" do
    ActiveJob::Base.queue_adapter = :test
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued
  end
# Checking job queue name
  it "enqueued job in 'default' queue" do
    ActiveJob::Base.queue_adapter = :test
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued.on_queue("default")
  end
# Checking job enqueued with no wait
  it "job enqueued with no wait" do
    ActiveJob::Base.queue_adapter = :test
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued.at(:no_wait)
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
    PersistSingleCurrentNewsToDataBaseJob.perform_later(new_news)
    expect(PersistSingleCurrentNewsToDataBaseJob).to(
      have_been_enqueued.with(new_news)
    )
  end

end