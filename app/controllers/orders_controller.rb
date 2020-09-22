class OrdersController < ApplicationController

  def show
    @order = Order.find_by(basket: @basket)
  end

  def create
    line_items = []

    total_price = 0

    @basket.basketItems.each do |item|
      total_price += item.artwork.price
    end

    order = Order.create!(amount: total_price, state: "pending", basket: @basket)

    @basket.basketItems.each do |item|
      new_item = {
        name: item.artwork.name,
        images: [item.artwork.photos.first],
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
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

end
