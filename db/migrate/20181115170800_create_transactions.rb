class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
  	create_table :transactions do |t|
      t.integer :coin_id
      t.integer :apiuser_id

      t.timestamps
    end
  end
end
