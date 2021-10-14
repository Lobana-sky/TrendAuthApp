class CurrentNewsApiService
  
  def initialize(params)
    @endpoint = params[:endpoint] || 'latest-news'
  end

  def call
    current_news_response = RestClient.get("#{base_url}/latest-news?language=en&apiKey=#{api_key}")
    return JSON.parse(current_news_response)['news']
  end
  
  private
  
    def base_url
      ENV['BASE_URL']
    end
    
    def api_key
      ENV['API_KEY']
    end

end