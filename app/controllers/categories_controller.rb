class CategoriesController < ApplicationController
  before_action :set_styles
  before_action :set_products

  def index
    @categories = Category.all
    @pagy, @records = pagy(@styles, items: 10)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    @pagy, @records = pagy(@products, items: 10)
  end

  def create
    @category = Category.new(style_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to styles_path(@category), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_styles
    @styles = Style.all
  end
  
  def set_products
    @products = Product.all
  end

end