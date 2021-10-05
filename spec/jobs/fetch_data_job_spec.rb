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
# Checking job enqueued with wait until beginning of day
  it "job enqueued with wait until beginning of day" do
    ActiveJob::Base.queue_adapter = :test
    FetchDataJob.set(:wait_until => Time.zone.today.beginning_of_day).perform_later
    expect(FetchDataJob).to have_been_enqueued.at(Time.zone.today.beginning_of_day)
  end

end