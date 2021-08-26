class CreateCurrentNews
    
  def initialize(params)
    @current_news_params = params[:current_news_params]
  end

  def call
    current_news = CurrentNews.create(@current_news_params)
    current_news.save
  end

end