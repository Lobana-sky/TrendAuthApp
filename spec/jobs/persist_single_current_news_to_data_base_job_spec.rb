require "rails_helper"

RSpec.describe PersistSingleCurrentNewsToDataBaseJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end
  # Checking job class name
  it "matches job class name PersistSingleCurrentNewsToDataBaseJob" do
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued
  end
  # Checking job queue name
  it "enqueued job in 'default' queue" do
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued.on_queue("default")
  end
  # Checking job enqueued with no wait
  it "job enqueued with no wait" do
    PersistSingleCurrentNewsToDataBaseJob.perform_later
    expect(PersistSingleCurrentNewsToDataBaseJob).to have_been_enqueued.at(:no_wait)
  end
  # Checking passed arguments to job
  it "passed new_news as hash argument successfully" do
    news = {
      id_news: "a5467dd9-95d3-4fd1-bf65-551424643527",
      category_id: 617
    }
    PersistSingleCurrentNewsToDataBaseJob.perform_later(news)
    expect(PersistSingleCurrentNewsToDataBaseJob).to(
      have_been_enqueued.with(news)
    )
  end
  
  # Checking perform
  describe "#perform", :vcr do
    let(:category) { Category.create!(:category_name => 'REGIONAL') }
    it "add news to current_news table" do
      news = {
        id_news: "a5467dd9-95d3-4fd1-bf65-551424643547",
        category_id: category.id
      }
      expect { PersistSingleCurrentNewsToDataBaseJob.perform_now(news) }
      .to change(CurrentNews, :count).by(1)
    end

    it "add news with current_news id" do
      news = {
        id_news: "a5467dd9-95d3-4fd1-bf65-551424643547",
        category_id: category.id
      }
      PersistSingleCurrentNewsToDataBaseJob.perform_now(news)
      expect(CurrentNews.last.id_news).to eq("a5467dd9-95d3-4fd1-bf65-551424643547")
    end
  end 

end