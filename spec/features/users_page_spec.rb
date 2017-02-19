require 'rails_helper'

include Helpers

describe "User" do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :style
  end

  describe "who has signed up" do
    it "can signin with right credentials" do
      sign_in(username:"Pekka", password:"Foobar1")

      expect(page).to have_content 'Welcome back!'
      expect(page).to have_content 'Pekka'
    end

    it "is redirected back to signin form if wrong credentials given" do
      sign_in(username:"Pekka", password:"wrong")

      expect(current_path).to eq(login_path)
      expect(page).to have_content 'Username and/or password mismatch username password'
    end
  end

  it "when signed up with good credentials, is added to the system" do
    visit signup_path
    fill_in('user_username', with:'Brian')
    fill_in('user_password', with:'Secret55')
    fill_in('user_password_confirmation', with:'Secret55')

    expect{
      click_button('Create User')
    }.to change{User.count}.by(1)
  end

  it "ratings in page if ratings given" do
    brewery = FactoryGirl.create :brewery
    style = FactoryGirl.create :style
    beer = Beer.create name: "olunen", style: style, brewery: brewery
    rating = Rating.create score: "30", beer_id: 1, user_id: 1
    visit user_path(User.first)
    expect(page).to have_content(beer)

  end
  it "no other persons ratings" do
    style = FactoryGirl.create (:style)
    user2 = FactoryGirl.create :user2
    brewery = FactoryGirl.create :brewery
    beer = Beer.create name: "olunen", style: style
    rating = Rating.create score: "30", beer_id: 1, user_id: 1

    visit user_path(user2)
    expect(page).not_to have_content(beer.name)

  end

  it "no other persons ratings" do
    style = FactoryGirl.create (:style)
    user2 = FactoryGirl.create :user2
    brewery = FactoryGirl.create :brewery
    beer = Beer.create name: "olunen", style: style
    rating = Rating.create score: "30", beer_id: 1, user_id: 2
    rating.delete

    visit user_path(user2)
    expect(page).not_to have_content(beer.name)

  end

  it "showing favourite brewery" do
    style = FactoryGirl.create :style
    style2 = Style.create name:"Amber Ale"
    user2 = FactoryGirl.create :user2
    brewery = FactoryGirl.create :brewery
    brewery2 = Brewery.create name: "panimo", year: 2000
    beer = Beer.create name: "olunen", style: style, brewery: brewery
    beer2 = Beer.create name: "olut", style: style, brewery: brewery
    beer3 = Beer.create name: "paha", style: style2, brewery: brewery2
    rating = Rating.create score: "30", beer: beer, user: User.first
    rating = Rating.create score: "2", beer: beer2, user: User.first
    rating = Rating.create score: "40", beer: beer3, user: user2

    visit user_path(User.first)
    expect(page).to have_content("anonymous")
  end

  it "showing favourite beer" do
    style = FactoryGirl.create :style
    user2 = FactoryGirl.create :user2
    beer = FactoryGirl.create :beer, style: style
    beer2 = FactoryGirl.create :beer, name: "olut"
    beer3 = FactoryGirl.create :beer, name: "paha"
    rating = Rating.create score: "30", beer: beer, user: User.first
    rating = Rating.create score: "2", beer: beer2, user: User.first
    rating = Rating.create score: "40", beer: beer3, user: user2

    visit user_path(User.first)
    expect(page).to have_content("moi")
  end

  it "showing favourite style" do
    style = FactoryGirl.create :style
    style2 = Style.create name:"Amber Ale"
    user2 = FactoryGirl.create :user2
    beer = FactoryGirl.create :beer, style: style
    beer2 = FactoryGirl.create :beer, name: "olut", style: style
    beer3 = FactoryGirl.create :beer, name: "paha", style: style2

    rating = Rating.create score: "30", beer: beer, user: User.first
    rating = Rating.create score: "2", beer: beer2, user: User.first
    rating = Rating.create score: "40", beer: beer3, user: user2

    visit user_path(User.first)
    expect(page).to have_content("Pilsner")
  end
end







