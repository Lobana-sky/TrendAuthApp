

# # def fill_in_category_name(single_current_news_category_array)
# #     category_name = single_current_news_category_array[0]
# #     if category_name.blank?
# #       category_name = "NONE"
# #     end
    
# #     return category_name
# #   end

# require 'rails_helper'
# require 'current_news_response_proccessing_and_mapping'

# RSpec.describe CurrentNewsResponseProccessingAndMapping, type: :service do 
#   describe '.fill_in_category_name()' do 
#     it 'should return the right category_name' do 
#       single_current_news_category_array = ["REGINAL"]
#       category_name = single_current_news_category_array[0]
#       expect(category_name).to eq "REGINAL"
#       expect(category_name == nil).to be false 
#       expect(fill_in_category_name(single_current_news_category_array)).to eq "REGINAL" 
#     end
#   end
# end
