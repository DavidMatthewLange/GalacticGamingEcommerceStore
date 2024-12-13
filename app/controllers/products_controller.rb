class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all

    # Search for products matching the keyword
    return if params[:search].blank?

    @products = @products.where(
      "products.name LIKE ? OR products.description LIKE ?",
      "%#{params[:search]}%", "%#{params[:search]}%"
    )

    # Search products matching the category only
    return unless params[:category].present? && params[:category] != "all"

    @products = @products.joins(:categories).where(categories: { id: params[:category] })

    # Pagination
    @products = @products.page(params[:page]).per(20)
  end

  def show
    @product = Product.find(params[:id])
  end
end
