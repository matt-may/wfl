require 'rails_helper'

RSpec.describe "recommendations/edit", :type => :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      :restaurant => nil,
      :user => nil
    ))
  end

  it "renders the edit recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendation_path(@recommendation), "post" do

      assert_select "input#recommendation_restaurant_id[name=?]", "recommendation[restaurant_id]"

      assert_select "input#recommendation_user_id[name=?]", "recommendation[user_id]"
    end
  end
end
