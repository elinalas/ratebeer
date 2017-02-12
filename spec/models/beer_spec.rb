
require 'rails_helper'

include Helpers

RSpec.describe Beer, type: :model do
  let(:brewery) { FactoryGirl.create :brewery, name: "hauska" }

  it "not valid because does not have style" do
    beer = Beer.new name:"Olut", style: "", brewery: brewery
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  it "not valid because does not have name" do
    beer = Beer.new name:"", style: "Pilsner", brewery: brewery
    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end
  it "is valid" do

    beer = Beer.create name: "Olut", style: "Pilsner", brewery: brewery
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "has a name and style" do
    beer = Beer.create name: "Olut", style: "Pilsner", brewery: brewery
    beer.name.should == "Olut"
    beer.style.should == "Pilsner"
  end
end