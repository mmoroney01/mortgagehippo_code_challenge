class CreateApiuser < ActiveRecord::Migration[5.1]
  def change
    create_table :apiusers do |t|
      t.string :api_key

      t.timestamps
    end
  end
end
