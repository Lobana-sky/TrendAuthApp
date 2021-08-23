class Category < ApplicationRecord
  has_many :current_news, dependent: :destroy
end
