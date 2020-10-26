class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    #@bid = Bid.new(artwork_id: @artwork.id)
    # @bid = @artowkr.bids.build(user_id: current_user.id, )
    @bid = @artwork.bids.build(artwork_id: @artwork.id )
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.artist_id = current_user.id
    if @artwork.save
      redirect_to artworks_path
    else
      render :new
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(
        :name,
        :description,
        :price,
        :category
      )
    end
end
