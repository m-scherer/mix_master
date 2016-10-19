require 'rails_helper'

RSpec.describe 'User deletes an artist' do
  scenario 'they click delete on an artist' do
    artist_name = "Grateful Dead"
    artist_image_path = "http://www.showbiz411.com/wp-content/uploads/2016/05/GratefulDead.jpg"
    Artist.create( name: artist_name,
                   image_path: artist_image_path
                  )
    visit "/artists"
    click_on "Grateful Dead"
    click_on "Delete Artist"

    expect(page).to_not have_content artist_name
  end

end
