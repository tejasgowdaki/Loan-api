class AccountMember < ActiveRecord::Base
    belongs_to :account
    belongs_to :member
end
