class ApiCurrentNewsController < ApplicationController
  def index
    @current_news = CurrentNews.find_each
    render json: @current_news, status: :ok
  end
  
  def show 
    @current_news = CurrentNews.where(category_id: params[:category_id])
    render json: @current_news, status: :ok
  end

end
