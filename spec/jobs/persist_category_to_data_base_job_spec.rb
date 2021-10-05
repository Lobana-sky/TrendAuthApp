require "rails_helper"

RSpec.describe PersistCategoryToDataBaseJob, type: :job do
# Checking job class name
  it "matches job class name PersistCategoryToDataBaseJob" do
    ActiveJob::Base.queue_adapter = :test
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued
  end
# Checking job queue name
  it "enqueued job in 'default' queue" do
    ActiveJob::Base.queue_adapter = :test
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued.on_queue("default")
  end
# Checking job enqueued with no wait
  it "job enqueued with no wait" do
    ActiveJob::Base.queue_adapter = :test
    PersistCategoryToDataBaseJob.perform_later
    expect(PersistCategoryToDataBaseJob).to have_been_enqueued.at(:no_wait)
  end
# Checking passed arguments to job
  it "passed category_name as string argument successfully" do
    ActiveJob::Base.queue_adapter = :test
    category_name = 'REGIONAL'
    PersistCategoryToDataBaseJob.perform_later(category_name)
    expect(PersistCategoryToDataBaseJob).to(
      have_been_enqueued.with(category_name)
    )
  end

end