class MembersController < ApplicationController
    def index
        members = Member.all
        render json: Response.new.success(members)
    end

    def fetch_accounts_by_member
        member = Member.find(params[:id])
        accounts = member.account_members.map{ |am| am.account }
        render json: Response.new.success(accounts)
    end

    def create
        member = Member.new(member_params)
        if member.save
            render json: Response.new.success(member)
        else
            render json: Response.new.error(member.errors.full_messages.join(', '))
        end
    end

    def update
        member = Member.find(params[:id])
        if member.update(member_params)
            render json: Response.new.success(member)
        else
            render json: Response.new.error(member.errors.full_messages.join(', '))
        end
    end

    private

    def member_params
        params.require(:member).permit(:name, :mobile)
    end
end