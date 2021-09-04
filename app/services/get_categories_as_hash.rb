class GetCategoriesAsHash
  
  def initialize(categories)
    @categories = categories
  end
      
  def call
    categories_hash = Hash.new
    @categories.each do |category|
    categories_hash[category.id] = category.category_name
    end
    return categories_hash
  end
end