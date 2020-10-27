class BidsController < ApplicationController
  def create
    bid = Bid.create(bid_params)
    #message = bid.create_bid
    bid.save
    @artwork = Artwork.find_by(id: params[:bid][:artwork_id])
    redirect_to artworks_path
    #redirect_to user_path
  end

  def new
    if params[:artwork_id] && @artwork = Artwork.find_by(params[:artwork_id]) 
      @bid = @artwork.bids.build
    else
      redirect_to artworks_path
    end
  end

  def index
    @bids = Bid.all
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
