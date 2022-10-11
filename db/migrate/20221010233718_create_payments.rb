class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :date

      t.timestamps
    end
  end
end
