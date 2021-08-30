class ResponseMapping

  def initialize(latest_news)
    @latest_news = latest_news
  end

  def get_category_id(news_category)
    category_name = news_category.empty? ? "None" : news_category[0]
    category = Category.find_by(category_name: category_name)
    if category != nil
      return category.id 
    else 
      # return CreateCategory.new(category_params: {category_name: category_name}).call.id
    return Category.create(@category_params)
    end
  end
  
  def call()
    mapped_latest_news = @latest_news.map do |news|
      if CurrentNews.find_by(id_news: news['id']) == nil 
        category_id = get_category_id(news['category'])
        news_attributes = {
          id_news: news['id'],
          title: news['title'],
          description: news['description'],
          url: news['url'],
          author: news['author'],
          image: news['image'],
          language: news['language'],
          published: news['published'],
          category_id: category_id
        }
      end
    end
  end 
end