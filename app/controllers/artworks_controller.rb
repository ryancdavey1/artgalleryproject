class ArtworksController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only:[:index]

  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    if !@artwork
      redirect_to artworks_path
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

  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    
    if !@artwork
      redirect_to artworks_path
    end
    @artwork.destroy
    redirect_to artworks_path

  end

  def create
    @artwork = current_user.produced_artworks.build(artwork_params)
    
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
