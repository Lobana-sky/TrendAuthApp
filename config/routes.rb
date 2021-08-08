Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'display_users' => 'pages#index'
end
