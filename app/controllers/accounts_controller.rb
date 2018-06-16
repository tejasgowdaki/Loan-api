class AccountsController < ApplicationController
    def index
        accounts = Account.all
        render json: accounts
    end

    def fetch_members_by_account
        account = Account.find(params[:id])
        members = account.account_members.map{ |am| am.member }
        render json: members
    end
end