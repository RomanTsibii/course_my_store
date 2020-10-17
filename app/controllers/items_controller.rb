class ItemsController < ApplicationController

  before_action :find_item, only: [:upvote, :show, :edit, :destroy, :update]
  before_action :check_if_admin, only: [:create, :edit, :destroy, :update, :new]

  def index
    @items = Item.all
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def expensive
    @items = Item.where(" price > 1000 ")
    render "index"
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      # flash[:notice] = 'Item added!'
      redirect_to item_path(@item)
    else
      # flash[:error] = 'Failed to create item!'
      render :new
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.delete
      redirect_to action: "index"
    else
      render :show
    end
  end


  private

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def item_params
    params.require(:item).permit(:name, :price, :real, :weight, :description, :id)
  end

end
