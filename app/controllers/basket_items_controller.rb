class BasketItemsController < ApplicationController
  def create
    artwork = Artwork.friendly.find(params[:artwork_id])
    BasketItem.create(artwork_id: artwork.id, basket_id: @basket.id)
    redirect_to basket_path(@basket)
  end

  def destroy
    basket_item = BasketItem.find(params[:id])
    artwork = basket_item.artwork
    basket_item.destroy
    if request.referrer == artwork_url(artwork.id)
      redirect_to artwork_path(artwork.id)
    else
      redirect_to basket_path
    end
  end
end
