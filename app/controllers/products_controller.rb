class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all

    return unless params[:search].present?

    @products = @products.where(
      "products.name LIKE ? OR products.description LIKE ?",
      "%#{params[:search]}%", "%#{params[:search]}%"
    )

    return unless params[:category].present? && params[:category] != "all"

    @products = @products.joins(:categories).where(categories: { id: params[:category] })
  end

  def show
    @product = Product.find(params[:id])
  end
end
