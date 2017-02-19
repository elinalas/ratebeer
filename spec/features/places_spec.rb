require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "are showing if possible" do
    allow(BeermappingApi).to receive(:places_in).with("sörnäinen").and_return(
        [ Place.new( name:"Bar Loose", id: 1 ), Place.new( name:"William K", id: 2) ]
    )
    visit places_path
    fill_in('city', with: 'sörnäinen')
    click_button "Search"

    expect(page).to have_content "Bar Loose"
    expect(page).to have_content "William K"

  end

  it "if there is no such place" do
    visit places_path
    fill_in('city', with: 'plaa')
    click_button "Search"

    expect(page).to have_content "No"
  end
end