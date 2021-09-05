class Category < ApplicationRecord
  has_many :current_news, dependent: :destroy

  def self.get_categories_as_hash(categories)
    categories_hash = Hash.new
    categories.each do |category|
      categories_hash[category.id] = category.category_name
    end
    return categories_hash
  end
end
