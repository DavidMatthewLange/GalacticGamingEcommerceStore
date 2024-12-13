class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all

    # Apply search if the search parameter is provided
    if params[:search].present?
      @products = @products.where(
        "products.name LIKE ? OR products.description LIKE ?",
        "%#{params[:search]}%", "%#{params[:search]}%"
      )
    end

    # Apply category filter if the category parameter is provided
    if params[:category].present? && params[:category] != "all"
      @products = @products.joins(:categories).where(categories: { id: params[:category] })
    end

    # Apply pagination
    @products = @products.page(params[:page]).per(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end
end
