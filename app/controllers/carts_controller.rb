class CartsController < ApplicationController

  def add_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[product_id] = item
    update_cart cart
    if request.referrer.include?("cart")
      redirect_to cart_path
    else
      redirect_to root_path
    end
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1 if cart.count > 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1 && cart.count > 1
    update_cart cart

    redirect_to cart_path
  end

end
