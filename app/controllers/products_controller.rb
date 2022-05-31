class ProductsController < ApplicationController
  
  before_action :set_categories
  before_action :update_counter_of_view, only: %i[show]
  

  def index
    @products = Product.all
    @pagy, @records = pagy(@products, items: 10)
  end

  def show
    @product = Product.find(params[:id])
    if Like.where(user: current_user, product_id: params[:product_id]).exists?
      @like = Like.where(user: current_user, product_id: params[:product_id])
      cookies[:variable] = 1
    end
  end

  def search
    @products = Product.where('title LIKE?', "%" + params[:q] + "%").order('title')
    @pagy, @records = pagy(@products, items: 10)
  end

  private

  def product_params
    params.require(:product).permit(:title, :content, :image, :category_id, :style_id, :counter_of_view)
  end

  def reset_cookies
    cookies[:variable] = 0
  end

  def set_categories
    @categories = Category.all
  end

  def update_counter_of_view
    @product = Product.find(params[:id])
    @product.update(counter_of_view: @product.counter_of_view += 1)
  end
  
end