class ApiCurrentNewsController < ApplicationController
  def index
    @current_news = CurrentNews.find_each
    render json: @current_news, status: :ok
  end
end
