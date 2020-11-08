class Artwork < ApplicationRecord
  has_many :bids
  has_many :users, through: :bids

  validates :name, :price, presence: true

  # counter -> add to belongs_to
  #return active method relation
  # artist_id -> most bids by user/artist (accepting that artist_id)
  # in migration -> add bid_count column
  def self.most_bids
    return Artwork.all.sort_by{|artwork| -artwork.bids.count}
  end
end
