class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.integer :amount
      t.integer :account_member_id

      t.timestamps null: false
    end
  end
end
