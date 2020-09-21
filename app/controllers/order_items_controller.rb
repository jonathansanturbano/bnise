class OrderItemsController < ApplicationController

  def create
    artwork = Artwork.find(params[:artwork_id])
    order_item = OrderItem.create(artwork_id: artwork.id, order_id: @order.id)
    redirect_to order_path(@order)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_item.destroy
    order = current_user.orders.where(state: "pending")
    redirect_to order_path(order)
  end
end
