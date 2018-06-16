class Saving < ActiveRecord::Base
    # Validations
    validates :amount, presence: true
    validates :account_member_id, presence: true
    validates :amount, numericality: { greater_than: 0 }

    # Associations
    belongs_to :account_member
end
