class SongsController < ApplicationController

  before_action :get_song, only:[:show, :edit, :update, :destroy]

  def index
   @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def show
  end

  def create
    @song = Song.new(params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    ))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    if @song.update(params.require(:song).permit(
      :title, :release_year, :released, :genre, :artist_name
    ))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

end
