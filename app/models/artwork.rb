class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many_attached :photos
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :dimensions, presence: true
  validates :material, presence: true
  validates :weight, presence: true
  monetize :price_cents
end
