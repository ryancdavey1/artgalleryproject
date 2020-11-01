class BidsController < ApplicationController
  def create
    #bid = Bid.create(bid_params)
    @bid = current_user.bids.build(bid_params)
    if @bid.save
      redirect_to user_path(User.find_by(id: @bid.user_id))
    else
      render :new
    end
    #byebug
    #message = bid.create_bid
    # @artwork = Artwork.find_by(id: params[:bid][:artwork_id])
    # redirect_to artworks_path
    
  end

  def self.most_bids

  end

  def new
    # if params[:artwork_id] && @artwork = Artwork.find_by(params[:artwork_id]) 
    #   @bid = @artwork.bids.build
    # else
    #   redirect_to artworks_path
    # end
    @bid = Bid.new
    @bid.user_id = current_user.id
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
