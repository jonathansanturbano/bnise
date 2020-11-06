class PaymentsController < ApplicationController
  def new
    @order = Order.where(basket: @basket).last
    total_price = 0.0
    @order.basket.basketItems.each do |item|
      total_price += item.artwork.price
    end
    @ups_rate = @order.amount - total_price
  end
end
