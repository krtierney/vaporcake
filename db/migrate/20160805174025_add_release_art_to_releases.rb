class AddReleaseArtToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :release_art, :string
  end
end
