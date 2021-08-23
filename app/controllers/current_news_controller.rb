class CurrentNewsController < ApplicationController
  
  def index 
    # FetchDataJob.set(wait: 1.minute).perform_later()
    @current_news = CurrentNews.page params[:page]
    @categories = Category.all
  end

end
