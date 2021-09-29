require 'rails_helper'
# require 'current_news_response_proccessing_and_mapping'

RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do
  latest_news = [{"id"=> "b5467dd9-95d3-4fd1-bf65-551424643526", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
    "category"=> ['regional']},
    {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643527", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
      "category"=> ['regional']},
    {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643528", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
      "category"=> []}
    ]
  # CurrentNewsResponseProccessingAndMapping.new(latest_news)
  describe '#call' do
    latest_news.map do |single_news|

      context 'single_news is already in CurrentNews table' do
        single_news = {"id"=> "b5467dd9-95d3-4fd1-bf65-551424643526", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> ['regional']}
        it 'should skip statements in unless condition' do
          # subject { CurrentNews.exists?(id_news: single_news["id"]) }
          # expect(CurrentNews.exists?(id_news: single_news["id"])).to eql(true)
        end
      end

      context 'single_news is NOT in CurrentNews table' do
        single_news = {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643527", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> ['regional']}
        context 'should go through statements in unless condition' do
          single_news["category"] = ['regional']
          it "single_news['category'] array is not empty" do
            category_name = 'regional'
            # expect(assigns[:category_name]).to eql('REGIONAL')
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
        single_news = {"id"=> "a5467dd9-95d3-4fd1-bf65-551424643528", "title"=> "American...", "description"=> "Currently...", "url"=> "https://kwwl...", "author"=> "Meg Swanson", "image"=> "https://qui...", "language"=> "en", "published"=> "2021-09-01 23:19:09.000000000 +0000", 
          "category"=> []}
        context 'should go through statements in unless condition' do
          single_news['category'] = []
          it "when single_news['category'] array is empty" do
            # category_name = [][0].upcase! 
            # expect(assigns[:category_name]).to eql('')
            category_name = "NONE"
            category_id = 682
            news_attributes = {
              id_news: "a5467dd9-95d3-4fd1-bf65-551424643528",
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



