require 'rails_helper'
require 'current_news_response_proccessing_and_mapping.rb'

RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do

  CurrentNews.delete_all
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

      it 'news should be added to returned array with "REGIONAL" as category name' do
        category_name = 'regional'
        category_id = category.id

        expect(CurrentNewsResponseProccessingAndMapping.new(news).call.length).to eq(1)
      end
    end
  end

end




        # expect(CurrentNewsResponseProccessingAndMapping.new(news).call).to eq([
        #   {:author=>nil,
        #    :category_id=>Category.find_or_initialize_by(category_name: "REGIONAL").id,
        #    :description=>nil,
        #    :id_news=>"a5467dd9-95d3-3333-bf65-551423333332",
        #    :image=>nil,
        #    :language=>nil,
        #    :published=>nil,
        #    :title=>nil,
        #    :url=>nil}
        #    ])



    # context 'news is NOT in current_news table and category array is EMPTY' do
    #   let(:news) { [{"id"=> "a5467dd9-95d3-3333-bf65-551423333333", "category"=> ['']}] }
 
    #   it 'news should be added to returned array with "NONE" as category name' do
    #     # category_name = "NONE"
    #     # category_none_id = category_none.id

    #     expect(CurrentNewsResponseProccessingAndMapping.new(news).call).to eq([
    #       {:author=>nil,
    #        :category_id=>Category.find_or_initialize_by(category_name: "NONE").id,
    #        :description=>nil,
    #        :id_news=>"a5467dd9-95d3-3333-bf65-551423333333",
    #        :image=>nil,
    #        :language=>nil,
    #        :published=>nil,
    #        :title=>nil,
    #        :url=>nil}
    #        ])
    #   end
    # end
    



