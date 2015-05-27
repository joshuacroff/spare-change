class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  belongs_to :charity
  has_many :transactions, dependent: :destroy

  def fullname
    "#{first_name} #{last_name}"
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password) if new_password != ''
    self.password_hash = @password
  end

end
