class CreateInstalments < ActiveRecord::Migration
  def change
    create_table :instalments do |t|
      t.integer :amount
      t.integer :interest
      t.integer :finance_id

      t.timestamps null: false
    end
  end
end
