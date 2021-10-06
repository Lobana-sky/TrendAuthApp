require 'rails_helper'
require 'current_news_response_proccessing_and_mapping.rb'

RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do

  CurrentNews.delete_all
  Category.delete_all
  describe '.call' do
    category = Category.create!(:category_name => 'REGIONAL')
    category_none = Category.create!(:category_name => 'NONE')

    CurrentNews.create!(:id_news => "a5467dd9-95d3-3333-bf65-551423333331", :category_id => category.id)
    current_news_count = CurrentNews.count
      
    context 'single_news is already in current_news table' do
      single_news = {"id"=> "a5467dd9-95d3-3333-bf65-551423333331", "category"=> ['regional']}
      it 'single_news should NOT be added to current_news table ' do
        expect(CurrentNews.exists?(id_news: "a5467dd9-95d3-3333-bf65-551423333331")).to eql(true)
        expect(CurrentNews.count).to eql(current_news_count)
      end
    end

    context 'single_news is NOT in current_news and category array is NOT empty ex:["regional"]' do
      single_news = {"id"=> "a5467dd9-95d3-3333-bf65-551423333332", "category"=> ['regional']}
      category_name = single_news['category'][0]
        
      it 'single_news should be added to current_news table with "REGIONAL" as category name' do
        expect(CurrentNews.exists?(id_news: "a5467dd9-95d3-3333-bf65-551423333332")).to eql(false)
        expect(category_name.blank?).to eql(false)
        CurrentNews.create!(:id_news => "a5467dd9-95d3-3333-bf65-551423333332", :category_id => category.id)
        expect(CurrentNews.count).to eql(current_news_count + 1)
      end
    end

    context 'single_news is NOT in current_news and category array is EMPTY' do
      single_news = {"id"=> "a5467dd9-95d3-3333-bf65-551423333333", "category"=> ['']}
      category_name = single_news['category'][0]
        
      it 'single_news should be added to current_news table with "NONE" as category name' do
        expect(CurrentNews.exists?(id_news: "a5467dd9-95d3-3333-bf65-551423333333")).to eql(false)
        expect(category_name.blank?).to eql(true)
        CurrentNews.create!(:id_news => "a5467dd9-95d3-3333-bf65-551423333333", :category_id => category_none.id)
        expect(CurrentNews.count).to eql(current_news_count + 1)
      end
    end
    
  end

end



