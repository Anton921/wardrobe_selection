class ProductsController < ApplicationController
  
  before_action :set_categories
  before_action :set_styles

  def index
    @products = Product.all
    @pagy, @records = pagy(@products, items: 10)
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path(@product), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def search
    @products = Product.where('title LIKE?', "%" + params[:q] + "%").order('title')
    @pagy, @records = pagy(@products, items: 10)
  end

  def search_by_category
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def search_by_style
    @style = Style.find(params[:id])
    @products = @style.products
  end

  private

  def product_params
    params.require(:product).permit(:title, :content, :image, :category_id, :style_id)
  end

  def set_categories
    @categories = Category.all
  end
  
  def set_styles
    @styles = Style.all
  end

end