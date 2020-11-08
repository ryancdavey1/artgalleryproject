class PopulateArtworkBidsCount < ActiveRecord::Migration[6.0]
  def up
    Artwork.find_each do |artwork|
      Artwork.reset_counters(artwork.id, :bids)
    end
  end
end
