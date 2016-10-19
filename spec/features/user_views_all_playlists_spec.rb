require 'rails_helper'

RSpec.describe "User views all playlists" do

  scenario "they see a list playlists" do

    playlist_one, playlist_two, playlist_three = create_list(:playlist, 3)

    visit playlists_path

    within("li:first") do
      expect(page).to have_link playlist_one.name, href: playlist_path(playlist_one)
    end
  end

end
