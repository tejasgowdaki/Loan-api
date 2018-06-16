class Member < ActiveRecord::Base
    has_many :account_members
    has_many :accounts, through: :account_members
end
