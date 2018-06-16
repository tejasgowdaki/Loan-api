class Account < ActiveRecord::Base
    has_many :account_members
    has_many :members, through: :account_members
end
