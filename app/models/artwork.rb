class Artwork < ApplicationRecord
  has_many :bids
  has_many :users, through: :bids

  validates :name, :price, presence: true
end
