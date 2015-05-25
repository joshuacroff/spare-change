class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount, scale: 2
      t.float :original_amount, scale: 2
      t.references :user
    end
  end
end
