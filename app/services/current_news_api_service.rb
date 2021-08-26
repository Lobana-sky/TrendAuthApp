class CurrentNewsApiService
  
  def initialize(params)
    @endpoint = params[:endpoint] || 'latest-news'
  end
    
  def call
    current_news_response = RestClient.get("#{base_url}/#{@endpoint}?language=en&apiKey=#{api_key}")
  rescue RestClient::ExceptionWithResponse => e
    {success: false, error: e}
  else
    response = JSON.parse(current_news_response)['news']
    {success: true, payload: response}
  end
  
  private
  
    def base_url
      ENV['BASE_URL']
    end
    
    def api_key
      ENV['API_KEY']
    end

end