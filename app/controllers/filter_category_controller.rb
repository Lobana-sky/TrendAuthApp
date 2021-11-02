class FilterCategoryController < ApplicationController
  def index
    categories = Category.find_each
    category = Category.find(params[:category_id])
    category_filter = category.current_news.group_by_day(:published).count
    chart_data = category_filter.to_a
    render json: chart_data, status: :ok
  end
end
