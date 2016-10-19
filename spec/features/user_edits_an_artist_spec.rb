require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they click edit on an artist" do
    artist_name = "Grateful Dead"
    artist_image_path = "http://www.showbiz411.com/wp-content/uploads/2016/05/GratefulDead.jpg"
    new_artist_name = "Johnny Cash"
    new_artist_image_path = "https://a1-images.myspacecdn.com/images03/33/24c7b24b89dc491b8cc5470826e88f9e/300x300.jpg"
    Artist.create( name: artist_name,
                   image_path: artist_image_path
                  )

    visit "/artists"
    click_on "Grateful Dead"
    click_on "Edit Artist"
    fill_in "artist_name", with: new_artist_name
    fill_in "artist_image_path", with: new_artist_image_path
    click_on "Update Artist"

    expect(page).to have_content new_artist_name
    expect(page).to have_css("img[src=\"#{new_artist_image_path}\"]")
  end

end
