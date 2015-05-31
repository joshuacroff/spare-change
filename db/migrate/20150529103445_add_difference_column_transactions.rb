class AddDifferenceColumnTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :difference, :decimal, precision: 8, scale: 2
  end
end
