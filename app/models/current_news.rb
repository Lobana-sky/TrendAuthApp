class CurrentNews < ApplicationRecord
  belongs_to :category
  paginates_per 25
  default_scope { order('published ASC') }
end
