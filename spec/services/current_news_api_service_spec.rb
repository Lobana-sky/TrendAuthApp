require 'rails_helper'
require 'current_news_api_service'
require 'rest_client'

RSpec.describe CurrentNewsApiService, :type => :request do
  
  it 'should return Current News data' do 
    result = RestClient.get 'https://api.currentsapi.services/v1/latest-news?apiKey=ppvVKctrJQz1oZb-RzjjrHr4fm34daUJqV-X3ZITDNbumJgL', 
    :content_type => :json, :accept => :json
    expect(result.code).to eq(200)
  end

end