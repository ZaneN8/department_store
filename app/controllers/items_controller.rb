class ItemsController < ApplicationController
  before_action :set_items  #, only: [:index, :show, :edit, :update, :destroy]


  def index
    # @store = Store.find(params[:store_id])
    @items = @store.items
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = @store.item.new
  end

  def create
    @item = @store.item.new(item_params)

    if @item.save
      redirect_item
    else
      render :new
    end
  end

  def edit
    @item = @store.item.find(params[:id])
  end

  def update
    @item = @store.item.find(params[:id])

    if @item.update(item_params)
      redirect_item
    else
      render :edit
    end
  end

    def destroy
      @item = @store.item.find(params[:id])
      @item.destroy
      redirect_item
    end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end

  def set_items
    @store = Store.find(params[:store_id])
  end

  def redirect_item
    redirect_to store_item_path(@store, @item)
  end
end
