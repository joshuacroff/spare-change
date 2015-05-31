class User < ActiveRecord::Base
  # users.password_hash in the database is a :string

  validates :username, uniqueness: true
  validates :username, presence: true


  include BCrypt

  belongs_to :charity
  has_many :transactions, dependent: :destroy

  def transaction_sum
    sum = 0
    self.transactions.each do |transaction|
      sum += transaction.difference
    end
    sum
  end

  def fullname
    "#{first_name} #{last_name}"
  end

  # def total_donations
  #   self.donations.reduce...
  # end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password) if new_password != ''
    self.password_hash = @password
  end

end
