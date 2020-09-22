class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @artworks = Artwork.all.order(:sold)
  end

  def show
    @artwork = Artwork.find(params[:id])
  end
end
