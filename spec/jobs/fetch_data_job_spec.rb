require "rails_helper"

RSpec.describe FetchDataJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  it "FetchDataJob enqueued" do
    expect {
      FetchDataJob.set(wait_until: Time.zone.today.beginning_of_day, queue: "default").perform_later()
    }.to have_enqueued_job.on_queue("default").at(Time.zone.today.beginning_of_day)
  end
  
  # Checking perform
  describe "#perform", :vcr => 'current_news' do
    it "enqueues a job for each news the API returns" do
      expect { FetchDataJob.new.perform_now 
      }.to have_enqueued_job(PersistSingleCurrentNewsToDataBaseJob).at_most(30)
    end
  end 

end

