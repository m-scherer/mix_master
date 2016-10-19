class ArtistsController < ApplicationController
  before_action :set_artist, only: [:edit, :update, :show, :destroy]


  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def update
    if @artist.update_attributes( artist_params )
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
