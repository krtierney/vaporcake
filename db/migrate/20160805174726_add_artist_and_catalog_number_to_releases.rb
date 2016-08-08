class AddArtistAndCatalogNumberToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :artist, :string
    add_column :releases, :catalog_number, :string
  end
end
