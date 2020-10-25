class AddColumnToArtworksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :category, :string
  end
end
