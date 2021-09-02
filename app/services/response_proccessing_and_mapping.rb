class ResponseProccessingAndMapping

  def initialize(latest_news)
    @latest_news = latest_news
  end

  def call()
    mapped_latest_news = @latest_news.map do |single_news|
      if !CurrentNews.exists?(id_news: single_news['id'])
        category_id = get_category_id(single_news)
        news_attributes = mapping_single_current_news(single_news, category_id)
      end
    end
  end 

  private
    
    def get_category_id(single_news)
      category_name = get_proper_category_name_fit_receiving_api_current_news(single_news['category'])
      category = check_category_to_add_and_return(category_name.upcase!)
      return category.id
    end

    def get_proper_category_name_fit_receiving_api_current_news(single_current_news_category_array)
      if single_current_news_category_array.empty? #current news has no category name so its category is "None"
        category_name = "NONE"
      else
        category_name = single_current_news_category_array[0]
      end
      return category_name
    end

    def check_category_to_add_and_return(category_name)
      Category.find_or_create_by!(category_name: category_name)
    end

    def mapping_single_current_news(single_news, category_id)
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