class BidsController < ApplicationController
  #skip_before_action :redirect_if_not_logged_in, only:[:most_bids]

  def create
    @bid = current_user.bids.build(bid_params)
    if @bid.save
      redirect_to user_path(User.find_by(id: @bid.user_id))
    else
      render :new
    end
  end

  def new
    @bid = Bid.new
    @bid.user_id = current_user.id
    #@bid.artwork_id = params[:artwork_id]
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @bids = @user.received_bids
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
