class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(
            name: params[:item][:name],
            price: params[:item][:price]
        )

        redirect_to item_url(@item)
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_url
    end
end