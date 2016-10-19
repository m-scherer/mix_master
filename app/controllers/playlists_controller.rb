class PlaylistsController < ApplicationController
  before_action :find_playlist, only: [:show, :edit, :update]
  before_action :all_songs, only: [:new, :edit]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    if @playlist.save
      redirect_to playlist_path(@playlist)
    else
      render :new
    end
  end

  def show
    @songs = @playlist.songs
  end

  def edit
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlist_path(@playlist)
    else
      render :edit
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name,song_ids:[])
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def all_songs
    @songs = Song.all
  end

end
