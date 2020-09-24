class StripeCheckoutSessionService
  def call(event)
    order = Order.find_by(checkout_session_id: event.data.object.id)
    order.update(state: 'paid')
    order.basket.update(state: 'past')
    order.basket.basketItems.each do |item|
      artwork = Artwork.find(item.artwork_id)
      artwork.update(sold: true)
    end
  end
end
