class PaymentsController < ApplicationController
  def new
    @order = Order.where(basket: @basket).last
    flash[:notice] = "You'll be redirected to your basket if inactive for 5 minutes."
  end
end
