class CheckoutController < ApplicationController
  def new
    @cart = session[:cart] || {}
    @products = Product.find(@cart.keys)
    @total_price = calculate_total
    @taxes = calculate_taxes
    @grand_total = @total_price + @taxes
  end

  def create
    @cart = session[:cart] || {}
    @order = Order.new(user: current_user, total_price: calculate_total + calculate_taxes,
                       status: "pending")

    if @order.save
      @cart.each do |product_id, quantity|
        product = Product.find(product_id)
        @order.order_items.create(
          product:    product,
          quantity:   quantity,
          unit_price: product.price,
          tax_rate:   calculate_tax_rate_for_product(product)
        )
      end
      session[:cart] = nil
      redirect_to order_confirmation_path(@order)
    else
      render :new
    end
  end

  private

  def calculate_total
    total = 0
    @cart.each do |product_id, quantity|
      product = Product.find(product_id)
      total += product.price * quantity
    end
    total
  end

  def calculate_taxes
    # Assuming a simple tax rate (you could calculate PST, GST, HST based on province here)
    total = calculate_total
    total * 0.13 # Tax rate (HST for example)
  end

  def calculate_tax_rate_for_product(product)
    # Use tax rate specific to product or region
    0.13 # Simplified for example
  end
end
