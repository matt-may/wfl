require 'rails_helper'

RSpec.describe "recommendations/index", :type => :view do
  before(:each) do
    assign(:recommendations, [
      Recommendation.create!(
        :restaurant => nil,
        :user => nil
      ),
      Recommendation.create!(
        :restaurant => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of recommendations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
