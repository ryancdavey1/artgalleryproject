class Artwork < ApplicationRecord
  has_many :bids
  has_many :users, through: :bids

  validates :name, :price, presence: true

  # counter -> add to belongs_to DONE 
  #return active method relation
  # artist_id -> most bids by user/artist (accepting that artist_id)
  # in migration -> add bid_count column DONE 
  def self.most_bids
    @artworks = Artwork.
      joins(:bids).
      select("artworks.*", 'COUNT("bids.id") AS bids_count').
      group('artworks.id')
  end
end
