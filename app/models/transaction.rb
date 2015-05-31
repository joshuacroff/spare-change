class Transaction < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  before_save :round_transaction, :difference

  def round_transaction
    self.amount = self.original_amount.ceil
  end

  def difference
    self.difference = self.amount - self.original_amount
  end

end

# test.each do |transaction|
#   transaction.difference = transaction.amount - transaction.original_amount
#   transaction.save!
# end


