class AddBidsCountToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :bids_count, :integer
  end
end
