require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'display_users', to: 'pages#index'

  get 'current_news', to: 'current_news#index'

  get 'display_chart', to: 'chart_data#index'
  
  get '/api/current_news/', to: 'api_current_news#index'
  get '/api/current_news/search', to: 'api_current_news#show'
  get '/api/current_news/category', to: 'filter_category#index'
  get '/api/category/', to: 'category#index'

  mount Sidekiq::Web => '/sidekiq'
end