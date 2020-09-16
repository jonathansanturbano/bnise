class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :name
      t.text :description
      t.boolean :sold
      t.integer :price

      t.timestamps
    end
  end
end
