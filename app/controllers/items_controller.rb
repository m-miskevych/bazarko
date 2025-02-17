class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    # @items = Item.all
    # @items = Item.page(params[:page]).per(3)
    @items = Item.search_by_name_or_category(params[:search]).page(params[:page]).per(3)
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
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find params[:id]
    if @item.update item_attributes
      redirect_to item_url(@item)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to items_url
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to item_url
  end

  private
  def item_attributes
      params.require(:item).permit(:name, :price, :category_id, images: [])
  end
end
