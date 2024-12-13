class CartController < ApplicationController
  def show
    @cart = session[:cart] || [] # Retrieve the cart from the session

    # Iterate over the cart to check each product's validity
    @cart.each do |product_id, details|
      product = Product.find_by(id: product_id)

      if product && product.price.present? # Check if product exists and price is not nil or empty
        # Product is valid, nothing to do here
      else
        # If product is missing or price is nil, handle it:

        # Option 1: Remove invalid item from the cart
        session[:cart].delete(product_id)

        # Option 2: You could also flag it for further handling, like notifying the user
        # For example, adding a message to the flash
        flash[:alert] = "One or more products in your cart are unavailable or missing a price."

        # Option 3: Log for debugging (optional)
        Rails.logger.error("Product with ID #{product_id} is missing or has no price.")
      end
    end
  end

  def add
    # Get product ID and quantity from params
    product_id = params[:product_id]
    quantity = params[:quantity].to_i

    session[:cart] ||= {}

    # Ensure quantity is always set to a non-zero value
    if quantity > 0
      if session[:cart][product_id]
        session[:cart][product_id][:quantity] = quantity
      else
        session[:cart][product_id] = { quantity: quantity }
      end
    end

    redirect_to add_to_cart_cart_index_path # Redirect to the cart to view the updated cart
  end

  def remove
    # Ensure the product_id is a string (which is how it's stored in the session)
    session[:cart].delete(params[:product_id].to_s)
    redirect_to cart_path
  end

  def clear_cart
    # Clear the entire cart
    session[:cart] = {}
    redirect_to clear_cart_cart_index_path
  end
end
