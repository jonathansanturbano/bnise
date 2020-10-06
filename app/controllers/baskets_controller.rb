class BasketsController < ApplicationController
  def show
    if @basket.basketItems.count > 0
      @basket.basketItems.each do |basket_item|
        basket_item.destroy if basket_item.artwork.sold == true
      end
    end
  end
end
