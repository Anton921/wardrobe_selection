class CategoriesController < ApplicationController
  before_action :set_products

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
    @pagy, @records = pagy(@products, items: 10)
  end

  private

  def set_products
    @products = Product.all
  end
end
