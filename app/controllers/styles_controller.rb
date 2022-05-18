class StylesController < ApplicationController
  before_action :set_categories
  before_action :set_products

  def index
    @styles = Style.all
    @pagy, @records = pagy(@styles, items: 10)
  end

  def new
    @style = Style.new
  end

  def show
    @style = Style.find(params[:id])
    @categories = @style.categories
    @products = @style.products
    @pagy, @records = pagy(@products, items: 10)
  end

  def create
    @style = Style.new(style_params)

    respond_to do |format|
      if @style.save
        format.html { redirect_to styles_path(@style), notice: 'Post was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def style_params
    params.require(:style).permit(:title, :content)
  end

  def set_categories
    @categories = Category.all
  end
  
  def set_products
    @products = Product.all
  end

end