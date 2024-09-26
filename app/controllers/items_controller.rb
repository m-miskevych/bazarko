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
        @item = Item.new item_attributes

        if @item.save
            redirect_to item_url(@item)
        else
            render "new", status: :unprocessable_entity
        end
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update item_attributes
            redirect_to item_url(@item)
        else
            render "edit", status: :unprocessable_entity
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        redirect_to items_url
    end

    private
    def item_attributes
        params.require(:item).permit(:name, :price)
    end
end
