class CurrentNews < ApplicationRecord
  paginates_per 10
  belongs_to :category
  default_scope { order('published ASC') }
end
