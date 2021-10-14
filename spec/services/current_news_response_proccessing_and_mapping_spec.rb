require 'rails_helper'
require 'current_news_response_proccessing_and_mapping.rb'

RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do

  describe '.call' do
    let(:category) { Category.create!(:category_name => 'REGIONAL') }
 
    before do
      CurrentNews.create!(:id_news => "a5467dd9-95d3-3333-bf65-551423333331", :category_id => category.id)
    end

    context 'news is already in current_news table' do
      let(:news) { [{"id"=> "a5467dd9-95d3-3333-bf65-551423333331", "category"=> ['regional']}] }

      it 'news should NOT be added to returned array' do
        expect(CurrentNewsResponseProccessingAndMapping.new(news).call).to eq([nil])
      end
    end

    context 'news is NOT in current_news table' do
      let(:news) { [{"id"=> "a5467dd9-95d3-3333-bf65-551423333332", "category"=> ['regional']}] }

      it 'news should be added to returned array' do
        expect(CurrentNewsResponseProccessingAndMapping.new(news).call).to eq(
          [{:author=>nil, :category_id=>270, 
          :description=>nil, :id_news=>"a5467dd9-95d3-3333-bf65-551423333332", 
          :image=>nil, :language=>nil, :published=>nil, :title=>nil, :url=>nil}]
        )
      end
    end
  end

end