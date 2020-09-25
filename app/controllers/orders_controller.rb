class OrdersController < ApplicationController
  skip_before_action :set_basket, only: :show

  def show
    @basket = current_user.baskets.last
    @order = Order.find_by(basket: @basket)
  end

  def create
    line_items = []

    total_price = 0

    @basket.basketItems.each do |item|
      total_price += item.artwork.price
    end

    order = Order.find_by(basket: @basket)

    if order.nil?
      order = Order.create!(amount: total_price, state: "pending", basket: @basket)
    else
      order.update(amount: total_price)
    end

    @basket.basketItems.each do |item|
      new_item = {
        name: item.artwork.name,
        # images: ["https://bnise.herokuapp.com/assets/white_logo_cropped-834dfd6d8fb58736072fa5820f673595570c8476b134852daa3369ab5000e7d0.png"],
        amount: item.artwork.price_cents,
        currency: 'eur',
        quantity: 1
      }
      line_items << new_item
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: order_url(order),
      cancel_url: basket_url(@basket)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

end
