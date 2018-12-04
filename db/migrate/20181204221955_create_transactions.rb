class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :coin_id, null: false
      t.integer :user_id, null: false
      t.boolean :deposit, null: false, default: false
      t.boolean :withdrawal, null: false, default: false
      
      t.timestamps
    end
  end
end
