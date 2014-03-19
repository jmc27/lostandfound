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
    item_params = params.require(:item).permit(:title, :description, :owner, :category)
    @item = Item.new(item_params)
    if @item.save
        redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
  def search
    @categories = Category.all.map {|c| [c.title, c.id]}
  end

  def do_search
    @items = Item.where(title: params[:title], category_id: params[:category_id])
    render :index
  end

end
