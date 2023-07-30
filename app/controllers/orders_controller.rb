class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    unless current_user
      flash[:danger] = "You must be logged in to access this."
      redirect_to new_customer_session_path
      return
    end
    charge = perform_stripe_charge
    order  = create_order

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, error: order.errors.full_messages.first
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, error: e.message
  end

  private

  def empty_cart!
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_total.to_i,
      description: "Trendz Order",
      currency:    'usd'
    )
  end

  def create_order()
    order = Order.new(customer_id: current_user&.id, total_amount: cart_total)
    cart.each do |product_id, details|
      if product = Product.find_by(id: product_id)
        quantity = details['quantity'].to_i
        order.order_items.new(
          product: product,
          quantity: quantity,
          price: product.price,
          total_price: product.price * quantity
        )
      end
    end
    order.save!
    order
  end

  def cart_total
    total = 0
    cart.each do |product_id, details|
      if p = Product.find_by(id: product_id)
        total += p.price * details['quantity'].to_i
      end
    end
    total
  end

end
