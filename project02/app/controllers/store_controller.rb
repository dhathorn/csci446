class StoreController < ApplicationController
  def index
	  @products = Product.find_products_for_sale
  end
  def add_to_cart
	  product = Product.find(params[:id])
	  @cart = find_cart
	  @cart.add_product(product)
  rescue ActiveRecord::RecordNotFound
	  logger.error("attempt to access invalid product #{params[:id]}")
	  redirect_to_index("Invalid product")
  end

  def empty_cart
	  session[:cart] = nil
	  redirect_to_index("Cart is empty")
  end

  private
  def redirect_to_index(msged)
	  flash[:notice] = msged
	  redirect_to :action => 'index'
  end

  def find_cart
	  unless session[:cart]
		 session[:cart] = Cart.new
	  end
	  session[:cart]
  end
end
