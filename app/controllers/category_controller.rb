class CategoryController < ApplicationController
  def index
    @categories = Category.find_each
    render json: @categories, status: :ok
  end

end
