class ResponseMapping

  def initialize(latest_news)
    @latest_news = latest_news
  end

  def call()
    mapped_latest_news = @latest_news.map do |news|
      if CurrentNews.find_by(id_news: news['id']) == nil 
        category_name = news['category'].empty? ? "None" : news['category'][0]
        category_id = Category.find_or_create_by!(category_name: category_name).id
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