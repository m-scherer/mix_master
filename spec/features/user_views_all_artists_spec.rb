require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they visit the artist index" do
    artist_name = "Grateful Dead"
    artist_image_path = "http://www.showbiz411.com/wp-content/uploads/2016/05/GratefulDead.jpg"
    Artist.create( name: artist_name,
                   image_path: artist_image_path
                  )

    visit "/artists"

    expect(page).to have_content artist_name
  end

  scenario "they click an artist" do
    artist_name = "Grateful Dead"
    artist_image_path = "http://www.showbiz411.com/wp-content/uploads/2016/05/GratefulDead.jpg"
    Artist.create( name: artist_name,
                   image_path: artist_image_path
                  )

    visit "/artists"
    click_on "Grateful Dead"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
