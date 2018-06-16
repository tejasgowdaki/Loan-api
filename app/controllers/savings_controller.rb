class SavingsController < ApplicationController
    def fetch_savings_by_account
        account = Account.find(params[:account_id])
        account_members = account.account_members
        savings = account_members.map{ |am| am.savings }
        savings = savings.flatten
        render json: Response.new.success(savings)
    end

    def fetch_savings_by_member
        member = Member.find(params[:member_id])
        account_members = member.account_members
        savings = account_members.map{ |am| am.savings }
        savings = savings.flatten
        render json: Response.new.success(savings)
    end

    def fetch_savings_by_account_member
        account_member = AccountMember.find_by(account_id: params[:account_id], member_id: params[:member_id])
        savings = account_member.savings
        render json: Response.new.success(savings)
    end

    def create
        saving = Saving.new(saving_params)
        if saving.save
            render json: Response.new.success(saving)
        else
            render json: Response.new.error(saving.errors.full_messages.join(', '))
        end
    end

    def update
        saving = Saving.find(params[:id])
        if saving.update(saving_params)
            render json: Response.new.success(saving)
        else
            render json: Response.new.error(saving.errors.full_messages.join(', '))
        end
    end

    private

    def saving_params
        params.require(:saving).permit(:amount, :account_member_id)
    end
end