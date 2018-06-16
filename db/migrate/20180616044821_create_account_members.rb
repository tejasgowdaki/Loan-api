class CreateAccountMembers < ActiveRecord::Migration
  def change
    create_table :account_members do |t|
      t.integer :account_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end
