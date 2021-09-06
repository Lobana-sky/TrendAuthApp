require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'display_users', to: 'pages#index'

  get 'current_news', to: 'current_news#index'

  get 'display_chart', to: 'chart_data#index'
  post 'display_chart', to: 'chart_data#index'

  mount Sidekiq::Web => '/sidekiq'
end