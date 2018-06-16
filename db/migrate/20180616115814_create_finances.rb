class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.integer :amount
      t.integer :balance
      t.integer :account_member_id
      t.boolean :pending, default: true

      t.timestamps null: false
    end
  end
end
