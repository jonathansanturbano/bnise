class AddWeightToArtwork < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :weight, :float
  end
end
