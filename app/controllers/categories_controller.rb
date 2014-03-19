class CategoriesController < ApplicationController
	def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    clean_params = params.require(:category).permit(:title, :description)
    @category = Category.new(clean_params)
    if @category.save
        redirect_to @category, notice: 'category was successfully created.'
    else
      render action: 'new'
    end
  end

end
