class RemoveDescriptionFromArtworks < ActiveRecord::Migration[6.0]
  def change
    remove_column :artworks, :description
  end
end
