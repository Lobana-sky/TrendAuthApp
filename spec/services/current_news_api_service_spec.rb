# require 'rails_helper'
# require 'current_news_api_service'


# RSpec.describe CurrentNewsApiService, type: :service do 
#   describe '.call' do
#     context 'When passing "latest-news" end point' do 
#       it 'should return a JSON object' do 
#         base_url = 'https://api.currentsapi.services/v1'
#         api_key = 'ppvVKctrJQz1oZb-RzjjrHr4fm34daUJqV-X3ZITDNbumJgL'
#         current_news_response = 
#         RestClient.get("https://api.currentsapi.services/v1/latest-news?apiKey=ppvVKctrJQz1oZb-RzjjrHr4fm34daUJqV-X3ZITDNbumJgL")
#         return_value = JSON.parse(current_news_response)['news']
#         expect(return_value).to eq('[{"author"=>"VOA News", "category"=>["world"], "description"=>"Monday is the COVID vaccination deadli...ovements add up to a worthy new flagship", "url"=>"https://www.t3.com/reviews/gopro-hero-10-black"}]...')
#         # assert_match /Example domains/, current_news_response.body
#       end
#     end
#   end
# end



# require 'rubygems'
# require 'test/unit'
# require 'vcr'

# VCR.configure do |config|
#   config.cassette_library_dir = "fixtures/vcr_cassettes"
#   config.hook_into :webmock
# end

# class VCRTest < Test::Unit::TestCase
#   def test_example_dot_com
#     VCR.use_cassette("synopsis") do
#       response = Net::HTTP.get_response(URI('http://www.iana.org/domains/reserved'))
#       assert_match /Example domains/, response.body
#     end
#   end
# end

