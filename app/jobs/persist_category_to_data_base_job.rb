class PersistCategoryToDataBaseJob < ApplicationJob
  queue_as :default

  def perform(category_name)
    new_category = Category.find_or_initialize_by(category_name: category_name)
    new_category.save!
    return new_category
  end
end
