class CurrentNewsResponseProccessingAndMapping

  def initialize(latest_news)
    @latest_news = latest_news
  end

  def call()
    mapped_latest_news = @latest_news.map do |single_news|
      unless CurrentNews.exists?(id_news: single_news['id'])
        category_id = get_category_id(single_news)
        news_attributes = get_mapped_single_current_news(single_news, category_id)
      end
    end
  end 

  private
    
    def get_category_id(single_news)
      category_name = fill_in_category_name(single_news['category'])
      category = check_category_to_add_and_return(category_name.upcase!)
      return category.id
    end

    def fill_in_category_name(single_current_news_category_array)
      category_name = single_current_news_category_array[0]
      if category_name.blank?
        category_name = "NONE"
      end
      return category_name
    end

    def check_category_to_add_and_return(category_name)
      PersistCategoryToDataBaseJob.perform_now(category_name) #string argument
    end

    def get_mapped_single_current_news(single_news, category_id)
      single_news_attributes = {
        id_news: single_news['id'],
        title: single_news['title'],
        description: single_news['description'],
        url: single_news['url'],
        author: single_news['author'],
        image: single_news['image'],
        language: single_news['language'],
        published: single_news['published'],
        category_id: category_id
      }
    end
end