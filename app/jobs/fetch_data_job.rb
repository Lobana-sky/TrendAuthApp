class FetchDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    prepare_news_table()
  end

  def prepare_news_table
    time = Time.new
    today_date = time.strftime("%Y-%m-%d %H:%M:%S")
    last_updated_date = get_last_updated_date(time)
    # if today_date > last_updated_date
      latest_news = fetch_current_news()
      create_news_and_save(latest_news, last_updated_date)
    # end
  end

  def get_last_updated_date(time)
    # check if db is empty to avoid throw error
    if CurrentNews.last != nil
      last_current_news_date = CurrentNews.last.published
    else
      last_current_news_date = time.prev_day(day = 10) #random date
    end
    last_date_adjust_time_zone = last_current_news_date
    return last_date_adjust_time_zone.strftime("%Y-%m-%d %H:%M:%S")
  end
  
  def get_category_id(news_category)
    category_name = news_category.empty? ? "None" : news_category[0]
    category = Category.find_by(category_name: category_name)
      if category != nil
        return category.id 
      else 
        return Category.create(category_name: category_name).id
      end
  end

  def fetch_current_news
    news_currents_response = RestClient.get("#{ENV['BASE_URL']}/latest-news?language=en&apiKey=#{ENV['API_KEY']}")
    return JSON.parse(news_currents_response)['news']
  end

  def create_news_and_save(latest_news, last_updated_date)
    latest_news.each do |news|
      if CurrentNews.find_by(id_news: news['id']) == nil && last_updated_date < news['published'] 
        category_id = get_category_id(news['category'])
        @current = CurrentNews.create(id_news: news['id'], title: news['title'], description: news['description'],
          url: news['url'], author: news['author'], image: news['image'], language: news['language'],
          published: news['published'], category_id: category_id)
        @current.save
      end
    end 
  end 
end

