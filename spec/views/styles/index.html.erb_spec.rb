require 'rails_helper'

RSpec.describe "styles/index", type: :view do
  before(:each) do
    assign(:styles, [
      Style.create!(
        :name => "",
        :description => "MyText"
      ),
      Style.create!(
        :name => "",
        :description => "MyText"
      )
    ])
  end
end
