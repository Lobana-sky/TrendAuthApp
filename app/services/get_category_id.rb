class GetCategoryId 

  def initialize(category)
    @category = category
  end

  def call
    category_name = news_category.empty? ? "None" : news_category[0]
    category = Category.find_by(category_name: category_name)
    if category != nil
      return category.id 
    else 
      return CreateCategory.new(category_params: {category_name: category_name}).id
    end
  end
end