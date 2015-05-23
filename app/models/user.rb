class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :charities
  has_many :transactions
end
