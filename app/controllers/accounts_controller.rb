class AccountsController < ApplicationController
    def index
        accounts = Account.all
        render json: Response.new.success(accounts)
    end

    def fetch_members_by_account
        account = Account.find(params[:id])
        members = account.account_members.map{ |am| am.member }
        render json: Response.new.success(members)
    end

    def create
        account = Account.new(account_params)
        if account.save
            render json: Response.new.success(account)
        else
            render json: Response.new.error(account.errors.full_messages.join(', '))
        end
    end

    def update
        account = Account.find(params[:id])
        if account.update(account_params)
            render json: Response.new.success(account)
        else
            render json: Response.new.error(account.errors.full_messages.join(', '))
        end
    end

    private

    def account_params
        params.require(:account).permit(:name)
    end
end