class CurrentNews < ApplicationRecord
  belongs_to :category
  # even we have default value in config file for all paginations file
  # we can set a specific value for a specific module
  paginates_per 25
  default_scope { order('published ASC') }
end
