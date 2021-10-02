class CurrentNewsController < ApplicationController
  def index 
    @categories = Category.find_each

    @current_news = get_current_news()

    # to pass in for view stuff for the user to know which date and which category he/she select
    @selected_published = fill_in_published()
    @selected_category = fill_in_category_name()
  end
end
