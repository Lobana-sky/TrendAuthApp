require 'rails_helper'

RSpec.describe User, type: :model do 
  pending 'add some examples to (or delete)' #{__FILE__}
end



# # rspec ./spec/file to test
# # rails db:migrate RAILS_ENV=test

#it block to describe a specific example, which is RSpec’s way to say “test case”.

#We are using another describe block to describe the add class method. 

#We are using a context block to describe the context under 
#which the add method is expected to return zero. context is technically the same as describe, 
#but is used in different places, to aid reading of the code.