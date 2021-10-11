require 'rails_helper'
require 'current_news_api_service'

RSpec.describe CurrentNewsApiService, :type => :request do
  
  it 'should return Current News data' do 
    news = CurrentNewsApiService.new({endpoint: 'latest-news'}).call()
    expect(news).not_to be_empty
  end

end