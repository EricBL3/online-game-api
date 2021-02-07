class Api::AccountsController < ApplicationController
    before_action: find_account, only: [:show, :update, :destroy]

    def index
        @accounts = Account.all
        render json: @accounts
    end

    def show
        render json: @account
    end

    def create
        @account = Account.new(account_params)
        if @account.save
            render json: @account
        else
            render json: { error: 'Unable to create Account.'}, status: 400
        end
    end

    def update
        if @account
            @account.update(account_params)
            render json: { message: 'Account successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update Account.' }, status: 400
        end
    end

    def destroy
        if @account
            @account.destroy
            render json: { message: 'Account successfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete Account' }, status: 400
        end
    end

    private 

    def account_params
        params.require(:account).permit(:username, :level)
    end

    def find_account
        @account = Account.find(params[:id])
    end
end
