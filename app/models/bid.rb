class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :artwork, counter_cache: true

  validates :price, presence: true

  def create_bid
    "your new bid has been created"
  end
end
