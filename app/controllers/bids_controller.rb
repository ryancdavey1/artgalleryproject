class BidsController < ApplicationController
  def create
    bid = Bid.create(bid_params)
    message = bid.create_bid
    bid.save
    @artwork = Artwork.find_by(id: params[:bid][:artwork_id])
    # @artwork.bids << bid
    #byebug
    redirect_to artworks_path
    #redirect_to user_path
  end

  private

  def bid_params
    params.require(:bid).permit(
    :user_id,
    :artwork_id,
    :price
    )
  end
end
