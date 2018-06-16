class AccountMember < ActiveRecord::Base
    # Associations
    belongs_to :account
    belongs_to :member
    has_many :savings
end
