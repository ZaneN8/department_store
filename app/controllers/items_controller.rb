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
    @item = @store.items.new
    render partial: "form"
  end

  def create
    @item = @store.items.new(item_params)

    if @item.save
      redirect_to store_item_path(@store, @item)
    else
      render :new
    end
  end

  def edit
    @item = @store.items.find(params[:id])
    render partial: "form"
  end

  def update
    @item = @store.items.find(params[:id])

    if @item.update(item_params)
      redirect_to store_item_path(@store, @item)
    else
      render :edit
    end
  end

    def destroy
      @item = @store.items.find(params[:id])
      @item.destroy
      redirect_to store_path(@store)
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
