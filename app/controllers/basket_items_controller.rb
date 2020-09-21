class BasketItemsController < ApplicationController
  def create
    artwork = Artwork.find(params[:artwork_id])
    BasketItem.create(artwork_id: artwork.id, basket_id: @basket.id)
    redirect_to basket_path(@basket)
  end

  def destroy
    basket_item = BasketItem.find(params[:id])
    basket_item.destroy
    basket = current_user.baskets.where(state: "pending")
    redirect_to basket_path
  end
end
