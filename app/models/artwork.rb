class Artwork < ApplicationRecord
  has_many :bids
  has_many :users, through: :bids

  validates :name, :price, presence: true

  def self.most_bids
    return Artwork.all.sort_by{|artwork| -artwork.bids.count}
  end
end
