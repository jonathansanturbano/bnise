class PaymentsController < ApplicationController
  def new
    @order = Order.find_by(basket: @basket)
  end
end
