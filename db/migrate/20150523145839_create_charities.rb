class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name, null: false
      t.string :street_address, null: false
      t.string :secondary_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.string :payment_method
    end
  end
end
