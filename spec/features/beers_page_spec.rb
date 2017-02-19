require 'rails_helper'

describe "Creating beers" do
  let!(:user) { FactoryGirl.create :user }
  let!(:style) { FactoryGirl.create :style }

  before :each do

    @breweries = ["Koff", "Karjala", "Schlenkerla"]
    year = 1896


    @breweries.each do |brewery_name|
      FactoryGirl.create(:brewery, name: brewery_name, year: year += 1)
    end

    visit breweries_path
  end


  it "not creating beer with invalid name" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    fill_in('beer[name]', with: '')

    select('Koff', from: 'beer[brewery_id]')


    expect{
      click_button "Create Beer"
    }.not_to change{Beer.count}.from(0)

    visit beers_path

    expect(Beer.count).to eq(0)
  end


  it "creating new beer is valid when name and style is correct" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    fill_in('beer[name]', with: 'Olut')
    select('Pilsner', from: 'beer[style_id]')
    select('Koff', from: 'beer[brewery_id]')


    expect{
      click_button "Create Beer"
    }.to change{Beer.count}.from(0).to(1)

    visit beers_path

    Beer.all.each do |beer|
      expect(page).to have_content beer.name
    end

    expect(Beer.count).to eq(1)
  end

  it "not creating if not logged in" do
    visit new_beer_path

    expect(page).to have_content "Sign in"

  end

end