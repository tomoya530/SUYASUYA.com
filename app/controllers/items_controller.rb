class ItemsController < ApplicationController
before_action :authenticate_user!,except: [:top]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
        @item.user_id = current_user.id
        if  @item.save
            redirect_to items_path
        else
           render :new
        end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if  @item.update(item_params)
        redirect_to item_path(@item.id)
    else
        render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

   private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :genre_id, :evaluation)
  end

end
