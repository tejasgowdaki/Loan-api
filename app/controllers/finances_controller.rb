class FinancesController < ApplicationController
    def fetch_finances_by_account
        account = Account.find(params[:account_id])
        account_members = account.account_members
        finances = account_members.map{ |am| am.finances }
        finances = finances.flatten
        render json: Response.new.success(finances)
    end

    def fetch_finances_by_member
        member = Member.find(params[:member_id])
        account_members = member.account_members
        finances = account_members.map{ |am| am.finances }
        finances = finances.flatten
        render json: Response.new.success(finances)
    end

    def fetch_finances_by_account_member
        account_member = AccountMember.find_by(account_id: params[:account_id], member_id: params[:member_id])
        finances = account_member.finances
        render json: Response.new.success(finances)
    end

    def create
        finance = Finance.new(finance_params)
        finance.balance = finance.amount
        if finance.save
            render json: Response.new.success(finance)
        else
            render json: Response.new.error(finance.errors.full_messages.join(', '))
        end
    end

    def update
        finance = Finance.find(params[:id])
        if finance.update(finance_params)
            render json: Response.new.success(finance)
        else
            render json: Response.new.error(finance.errors.full_messages.join(', '))
        end
    end

    private

    def finance_params
        params.require(:finance).permit(:amount, :balance, :account_member_id, :pending)
    end
end