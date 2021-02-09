class Api::AccountsController < ApplicationController
    before_action :find_account, only: [:show, :update, :destroy]

    def_param_group :account do
        property :id, Integer, desc: "id of the account"
        param :username, String, required: true
        param :level, Integer, required: true
        property :created_at, DateTime, desc: "timestamp of creation"
        property :updated_at, DateTime, desc: "timestamp of last update"
    end

    # documentation
    api :GET, '/accounts', "Returns all the accounts"
    # function
    def index
        @accounts = Account.all
        render json: @accounts
    end

    # documentation
    api :GET, '/accounts/:id', "Returns the account with the given id"
    param :id, Integer, desc: 'id of the requested account', required: true
    # function
    def show
        render json: @account
    end

    # documentation
    api :POST, '/accounts', "Creates an account"
    param_group :account
    returns :account
    formats ['json']
    example "
    JSON BODY:
        'account': { 
            'username': String,
            'level': Integer
        } 
    RESPONSE BODY:
    {
        'id': Integer,
        'username': String,
        'level': Integer,
        'created_at': DateTime,
        'updated_at': DateTime 
    }"
    # function
    def create
        @account = Account.new(account_params)
        if @account.save
            render json: @account
        else
            render json: { error: 'Unable to create Account.'}, status: 400
        end
    end

    # documentation
    api :PUT, '/accounts/:id', " Updates the account with the given id"
    param_group :account
    returns :code => 200 do
        property :message, String, desc: "Account successfully updated."
    end
    formats ['json']
    example "
    JSON BODY:
        'account': { 
            'username': String,
            'level': Integer
        } 
    RESPONSE BODY:
    {
        'message': 'Account successfully updated.'
    }"
    # function
    def update
        if @account
            @account.update(account_params)
            render json: { message: 'Account successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update Account.' }, status: 400
        end
    end

    # documentation
    api :DESTROY, '/accounts/:id', "Deletes the account with the given id as well as any items that the account had"
    param :id, Integer, desc: 'id of the requested account', required: true
    formats ['json']
    example "
    RESPONSE BODY:
    {
        'message': 'Account successfully deleted.'
    }"
    # function
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
