class AddPriceToTeddies < ActiveRecord::Migration[6.0]
  def change
    add_monetize :artworks, :price, currency: { present: false }
  end
end
