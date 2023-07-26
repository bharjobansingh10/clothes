class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search]).page(params[:page])
    @featured_products =  Product.search(params[:search]).where(is_featured: true).page(params[:page])
    @recent_products = Product.search(params[:search]).where("products.updated_at >= ?", 5.days.ago).page(params[:page])
  end

  def show
    @product = Product.find params[:id]
  end

end
