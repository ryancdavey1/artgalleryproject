class User < ApplicationRecord
  
  has_many :bids
  has_many :artworks, through: :bids
  has_many :produced_artworks, foreign_key: :artist_id, class_name: 'Artwork'

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  
end
