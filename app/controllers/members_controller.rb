class MembersController < ApplicationController
    def index
        members = Member.all
        render json: members
    end

    def fetch_accounts_by_member
        member = Member.find(params[:id])
        accounts = member.account_members.map{ |am| am.account }
        render json: accounts
    end
end