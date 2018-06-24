class Instalment < ActiveRecord::Base
    # Validations
    validates :amount, presence: true
    validates :interest, presence: true
    validates :finance_id, presence: true
    validates :amount, numericality: { greater_than: 0 }
    validates :interest, numericality: { greater_than_or_equal_to: 0 }

    # Associations
    belongs_to :finance

    # Callbacks
    after_save :update_finance

    private

    def update_finance
        finance = self.finance
        instalments = finance.instalments
        balance = finance.amount - instalments.sum(:amount) if finance.amount >= instalments.sum(:amount)
        pending = balance == 0 ? false : true
        finance.update_attributes(balance: balance, pending: pending )
        finance.save
    end
end
