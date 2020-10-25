class User < ApplicationRecord
  has_secure_password
  has_many :bids
  has_many :artworks, through: :bids
  has_many :produced_artworks, foreign_key: :artist_id, class_name: 'Artwork'

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
