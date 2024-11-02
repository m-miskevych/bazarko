class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
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
    @item = current_user.items.new item_attributes

    if @item.save
      redirect_to item_url(@item)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])

    if @item.user_id != current_user.id
      redirect_to items_url, alert: "Nemas opravenenie editovat tento inzerat"
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      if @item.update item_attributes
        redirect_to item_url(@item)
      else
        render "edit", status: :unprocessable_entity
      end
    else
      redirect_to items_url, alert: "Nemas opravenenie editovat tento inzerat"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to items_url
    else
      redirect_to items_url, alert: "Nemas opravnenie vymazat tento inzerat."
    end
  end

  private
  def item_attributes
      params.require(:item).permit(:name, :price, :category_id)
  end
end
