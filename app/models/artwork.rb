class Artwork < ApplicationRecord
  has_many_attached :photos
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :price, presence: true
  validates :dimensions, presence: true
  validates :material, presence: true
  monetize :price_cents
end
