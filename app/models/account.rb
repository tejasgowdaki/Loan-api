class Account < ActiveRecord::Base
    # Validations
    validates :name, presence: true

    # Associations
    has_many :account_members
    has_many :members, through: :account_members
end
