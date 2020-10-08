class OrdersController < ApplicationController
  skip_before_action :set_basket, only: :show

  def show
    @basket = current_user.baskets.last
    @order = Order.find_by(basket: @basket)
  end

  def create

    sold_artworks = []

    @basket.basketItems.each do |item|
      sold_artworks << item.artwork.name && item.destroy if item.artwork.sold == true
    end

    if sold_artworks.empty?

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
        shipping_address_collection: {
          allowed_countries: ['FR']
        },
        success_url: order_url(order),
        cancel_url: basket_url(@basket)
      )

      order.update(checkout_session_id: session.id)
      redirect_to new_order_payment_path(order), notice: "You'll be redirected to your basket if inactive for 5 minutes."
    else
      a = "is" if sold_artworks.count == 1
      a = "are" if sold_artworks.count > 1
      redirect_to basket_path(@basket), notice: "Sorry #{sold_artworks.join(',')} #{a} gone}"
    end
  end

end
