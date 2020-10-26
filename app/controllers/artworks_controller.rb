class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    if !@artwork
      redirect_to artworks_path
    else
      @bid = @artwork.bids.build(artwork_id: @artwork.id )
    end
  end

  def new
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find_by(id: params[:id])
    if !@artwork
      redirect_to artworks_path
    end
  end

  def update
    @artwork = Artwork.find_by(id: params[:id])
    if !@artwork
      redirect_to artworks_path
    end

    if @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork)
    else
      render :edit
    end

    
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
