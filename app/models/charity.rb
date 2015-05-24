class Charity < ActiveRecord::Base
  # Remember to create a migration!
  has_many :users
end
