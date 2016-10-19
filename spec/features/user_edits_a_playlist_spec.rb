require 'rails_helper'

RSpec.describe "User edits a playlist" do
  let!(:playlist) { create_list(:playlist, 1).first }
  let(:songs) { create_list(:song, 2) }

  scenario "playlist changes are persisted" do

    song_one, song_two = songs
    new_playlist_name = "Playlist A"
    visit playlists_path
    click_on playlist.name
    click_on "Edit Playlist"
    fill_in "playlist_name", with: new_playlist_name
    find(:css, "#song-#{song_one.id}").set(true)
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name

    click_on "Edit Playlist"
    find(:css, "#song-#{song_two.id}").set(true)
    find(:css, "#song-#{song_one.id}").set(false)
    click_on "Update Playlist"

    expect(page).to have_content song_two.title
    expect(page).to_not have_content song_one.title
  end

end
