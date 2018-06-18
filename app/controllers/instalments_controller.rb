class InstalmentsController < ApplicationController
    def fetch_instalments_by_finance
        finance = Finance.find(params[:finance_id])
        instalments = finance.instalments
        render json: Response.new.success(instalments)
    end

    def create
        instalment = Instalment.new(instalment_params)
        if instalment.save
            render json: Response.new.success(instalment)
        else
            render json: Response.new.error(instalment.errors.full_messages.join(', '))
        end
    end

    def update
        instalment = Instalment.find(params[:id])
        if instalment.update(instalment_params)
            render json: Response.new.success(instalment)
        else
            render json: Response.new.error(instalment.errors.full_messages.join(', '))
        end
    end

    private

    def instalment_params
        params.require(:instalment).permit(:amount, :interest, :finance_id)
    end
end