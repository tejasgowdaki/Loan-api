class Member < ActiveRecord::Base
    # Validations
    validates :name, presence: true
    validates :mobile, presence: true
    validates :mobile, numericality: true, length: { minimum: 10, maximum: 10 }, format: { with: /[0-9]+/ }

    # Associations
    has_many :account_members
    has_many :accounts, through: :account_members
end
