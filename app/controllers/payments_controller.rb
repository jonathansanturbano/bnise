class PaymentsController < ApplicationController
  def new
    @order = Order.where(basket: @basket).last
  end
end
