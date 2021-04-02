class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  private

  def is_sold_out?(product) 
    product.quantity < 1
  end
  helper_method :is_sold_out?
  
end
