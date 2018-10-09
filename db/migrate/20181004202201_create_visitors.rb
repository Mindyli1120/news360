class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :date_time
      t.bigint :user_id
      t.integer :os
      t.integer :device

      t.timestamps null: true
    end
  end
end
