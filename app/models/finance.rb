class Finance < ActiveRecord::Base
    # Validations
    validates :amount, presence: true
    validates :account_member_id, presence: true
    validates :amount, numericality: { greater_than: 0 }
    validates :balance, numericality: { greater_than_or_equal_to: 0 }

    # Associations
    belongs_to :account_member

    # Callbacks
    before_update :update_balance

    private

    def update_balance
        self.balance = self.amount
    end
end
