require "rails_helper"

RSpec.describe PersistCategoryToDataBaseJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end
# Checking job class name
  it "matches job class name PersistCategoryToDataBaseJob" do
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued
  end
# Checking job queue name
  it "enqueued job in 'default' queue" do
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued.on_queue("default")
  end
# Checking job enqueued with no wait
  it "job enqueued with no wait" do
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued.at(:no_wait)
  end
# Checking passed arguments to job
  it "passed category_name as string argument successfully" do
    category_name = 'CATEGORY'
    PersistCategoryToDataBaseJob.perform_later(category_name)
    expect(PersistCategoryToDataBaseJob).to(
      have_been_enqueued.with(category_name)
    )
  end
# Checking perform
  describe "#perform", :vcr do
    category_name = 'CATEGORY'
    it "add category to category table" do
      expect { PersistCategoryToDataBaseJob.perform_now(category_name) }.to change(Category, :count).by(1)
    end

    it "with 'CATEGORY' as category name" do
      PersistCategoryToDataBaseJob.perform_now(category_name)
      expect(Category.last.category_name).to eq(category_name)
    end
  end 

end