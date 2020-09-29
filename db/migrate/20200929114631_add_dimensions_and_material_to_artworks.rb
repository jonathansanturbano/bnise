class AddDimensionsAndMaterialToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :dimensions, :string
    add_column :artworks, :material, :string
  end
end
