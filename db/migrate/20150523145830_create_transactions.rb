class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :original_amount, precision: 8, scale: 2
      t.references :user
    end
  end
end
