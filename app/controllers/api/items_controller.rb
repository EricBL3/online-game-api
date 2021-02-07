class Api::ItemsController < ApplicationController
    before_action: find_item, only: [:show, :update, :destroy]

    def index
        @items = item.all
        render json: @items
    end

    def show
        render json: @item
    end

    def create
        @item = item.new(item_params)
        if @item.save
            render json: @item
        else
            render json: { error: 'Unable to create Item.'}, status: 400
        end
    end

    def update
        if @item
            @item.update(item_params)
            render json: { message: 'Item successfully updated.' }, status: 200
        else
            render json: { error: 'Unable to update Item.' }, status: 400
        end
    end

    def destroy
        if @item
            @item.destroy
            render json: { message: 'Item successfully deleted.' }, status: 200
        else
            render json: { error: 'Unable to delete Item' }, status: 400
        end
    end

    private 

    def item_params
        params.require(:item).permit(:name, :description)
    end

    def find_item
        @item = item.find(params[:id])
    end
end
