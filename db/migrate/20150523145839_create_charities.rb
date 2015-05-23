class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :payment_method
    end
  end
end
