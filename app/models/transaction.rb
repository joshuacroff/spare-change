class Transaction < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  before_save :round_transaction

  def round_transaction
    self.amount = self.original_amount.ceil
  end

end
