require 'rails_helper'

RSpec.describe "ratings/show", :type => :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :rate => 1,
      :user => nil,
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
