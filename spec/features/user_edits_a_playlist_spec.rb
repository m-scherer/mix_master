require 'rails_helper'

RSpec.describe "User edits a playlist" do
  scenario "playlist changes are persisted" do

    playlist_one, playlist_two = create_list(:playlist, 2)
    song_one, song_two = create_list(:song, 2)

    new_playlist_name = "Playlist A"

    visit playlists_path
    click_on playlist_one.name
    click_on "Edit Playlist"
    fill_in "playlist_name", with: new_playlist_name
    find(:css, "#song-#{song_one.id}").set(true)
    click_on "Update Playlist"

    expect(page).to have_content new_playlist_name
  
    click_on "Edit Playlist"
    find(:css, "#song-#{song_two.id}").set(true)
    find(:css, "#song-#{song_one.id}").set(false)
    click_on "Update Playlist"
    save_and_open_page

    expect(page).to have_content song_two.title
    expect(page).to_not have_content song_one.title
  end

end
