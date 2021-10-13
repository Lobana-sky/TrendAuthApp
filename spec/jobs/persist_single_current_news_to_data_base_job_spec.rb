require "rails_helper"

RSpec.describe PersistSingleCurrentNewsToDataBaseJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end
  it "PersistSingleCurrentNewsToDataBaseJob enqueued" do
    news = {
      id_news: "a5467dd9-95d3-4fd1-bf65-551424643527",
      category_id: 617
    }
    expect {
      PersistSingleCurrentNewsToDataBaseJob.set(queue: "default").perform_later(news)
    }.to have_enqueued_job.with(news).on_queue("default").at(:no_wait)
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

    it "with 'a5467dd9-95d3-4fd1-bf65-551424643547' as id" do
      news = {
        id_news: "a5467dd9-95d3-4fd1-bf65-551424643547",
        category_id: category.id
      }
      PersistSingleCurrentNewsToDataBaseJob.perform_now(news)
      expect(CurrentNews.last.id_news).to eq("a5467dd9-95d3-4fd1-bf65-551424643547")
    end
  end 

end