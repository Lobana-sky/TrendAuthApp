require 'rails_helper'
require 'current_news_response_proccessing_and_mapping'

RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do  
  describe '#call' do
    context 'iterate to @latest_news items and for each item single_news' do 


      context 'single_news is already in CurrentNews table' do
        single_news = {"id"=> "b5467dd9-95d3-4fd1-bf65-551424643526", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> ['regional']}
        it 'should skip statements in unless condition' do
          # expect(CurrentNews.exists?(id_news: single_news["id"])).to eql(true)
        end
      end

      context 'single_news is NOT in CurrentNews table' do
        single_news = {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643527", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> ['regional']}
        context 'should go through statements in unless condition' do
          single_news['category'] = ['regional']
          it "single_news['category'] is not empty" do
            category_name = 'REGIONAL'
            category_id = 617
            news_attributes = {
              id_news: "a5467dd9-95d3-4fd1-bf65-551424643527",
              title: "American...",
              description: "Currently...",
              url: "https://kwwl...",
              author: "Meg Swanson",
              image: "https://qui...",
              language: "en",
              published: "2021-09-01 23:19:09.000000000 +0000",
              category_id: 617
            }
          end
        end
      end

      context 'single_news is NOT in CurrentNews table' do
        single_news = {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643527", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> []}
        context 'should go through statements in unless condition' do
          single_news['category'] = []
          it "when single_news['category'] is empty" do
            category_name = 'NONE'
            category_id = 682
            news_attributes = {
              id_news: "a5467dd9-95d3-4fd1-bf65-551424643527",
              title: "American...",
              description: "Currently...",
              url: "https://kwwl...",
              author: "Meg Swanson",
              image: "https://qui...",
              language: "en",
              published: "2021-09-01 23:19:09.000000000 +0000",
              category_id: 682
            }
          end
        end
      end

      
    end
  end
end

  # def call()
  #   mapped_latest_news = @latest_news.map do |single_news|
  #     unless CurrentNews.exists?(id_news: single_news['id'])
  #       category_id = get_category_id(single_news)
  #       news_attributes = get_mapped_single_current_news(single_news, category_id)
  #     end
  #   end
  # end 



