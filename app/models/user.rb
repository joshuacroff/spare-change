require 'BCrypt'

class User < ActiveRecord::Base

  # users.password_hash in the database is a :string
  include BCrypt

  belongs_to :charity
  has_many :transactions

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
