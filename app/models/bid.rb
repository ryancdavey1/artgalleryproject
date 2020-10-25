class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :artwork

  validates :price, presence: true
end
