class Basket < ApplicationRecord
  belongs_to :user
  has_many :basketItems
  has_many :sculptures, through: :basketItems
end
