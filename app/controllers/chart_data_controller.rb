class ChartDataController < ApplicationController
  def index
    id_for_searching_category = params[:search_word]["id"].to_i
    @name_for_searching_category = Category.find(id_for_searching_category).category_name

    @get_data_for_category_prev_week = 
      CurrentNews.get_data_for_category_prev_week(id_for_searching_category)
    @get_data_for_category_entire_time = 
      CurrentNews.get_data_for_category_entire_time(id_for_searching_category)
    @all_current_news_by_published_date = 
      CurrentNews.get_current_news_by_published()
  end
    
end
