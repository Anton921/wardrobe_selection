class StylesController < ApplicationController
  before_action :set_categories, only: [:show]
  before_action :set_products

  def index
    @styles = Style.all
    @pagy, @records = pagy(@styles, items: 10)
  end

  def show
    @style = Style.find(params[:id])
    @categories = @style.categories
    @products = @style.products
    @pagy, @records = pagy(@products, items: 10)
  end

  private

  def set_categories
    @categories = Category.all
  end
  
  def set_products
    @products = Product.all
  end

end
