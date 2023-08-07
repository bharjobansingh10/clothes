class ProductsController < ApplicationController

  def index
    @products = Product.search(params[:search]).page(params[:page])
    @featured_products =  Product.search(params[:search]).where(is_featured: true).page(params[:page])
    @recent_products = Product.search(params[:search]).where("products.updated_at >= ?", 5.days.ago).page(params[:page])
  end

  def show
    @product = Product.find params[:id]
  end

  def featured
    @featured_products =  Product.where(is_featured: true).page(params[:page])
  end

  def recent
    @recent_products = Product.where("products.updated_at >= ?", 5.days.ago).page(params[:page])
  end

  def about_us
    @about = About&.last
  end

  def contact_us
    @contact = ContactU&.last
  end

  def all_products
    @all_products =  Product.all.page(params[:page])
  end

end
