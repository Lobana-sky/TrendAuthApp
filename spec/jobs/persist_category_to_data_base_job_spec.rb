require "rails_helper"

RSpec.describe PersistCategoryToDataBaseJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end
  
  it "PersistCategoryToDataBaseJob enqueued" do
    category_name = 'CATEGORY'
    expect {
      PersistCategoryToDataBaseJob.set(queue: "default").perform_later(category_name)
    }.to have_enqueued_job.with(category_name).on_queue("default").at(:no_wait)
  end

# Checking perform
  describe "#perform", :vcr do
    category_name = 'CATEGORY'
    it "add category to category table" do
      expect { PersistCategoryToDataBaseJob.perform_now(category_name) 
      }.to change(Category, :count).by(1)
    end

    it "with 'CATEGORY' as category name" do
      PersistCategoryToDataBaseJob.perform_now(category_name)
      expect(Category.last.category_name).to eq(category_name)
    end
  end 

end