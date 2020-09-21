class BasketItem < ApplicationRecord
  belongs_to :artwork
  belongs_to :basket
end
