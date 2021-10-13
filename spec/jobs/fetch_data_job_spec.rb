require "rails_helper"

RSpec.describe FetchDataJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end
  # Checking job class name
  it "matches job class name FetchDataJob" do
    FetchDataJob.perform_later
    expect(FetchDataJob).to have_been_enqueued
  end
  # Checking job queue name
  it "enqueued job in 'default' queue" do
    FetchDataJob.perform_later
    expect(FetchDataJob).to have_been_enqueued.on_queue("default")
  end
  # Checking job enqueued with wait until beginning of day
  it "job enqueued with wait until beginning of day" do
    FetchDataJob.set(:wait_until => Time.zone.today.beginning_of_day).perform_later
    expect(FetchDataJob).to have_been_enqueued.at(Time.zone.today.beginning_of_day)
  end
  # Checking perform
  describe "#perform", :vcr => 'current_news' do
    it "enqueues a job for each news the API returns" do
      expect { FetchDataJob.new.perform_now }
      .to have_enqueued_job(PersistSingleCurrentNewsToDataBaseJob).exactly(30)
    end
  end 

end

