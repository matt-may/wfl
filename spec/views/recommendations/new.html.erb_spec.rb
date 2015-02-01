require 'rails_helper'

RSpec.describe "recommendations/new", :type => :view do
  before(:each) do
    assign(:recommendation, Recommendation.new(
      :restaurant => nil,
      :user => nil
    ))
  end

  it "renders new recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendations_path, "post" do

      assert_select "input#recommendation_restaurant_id[name=?]", "recommendation[restaurant_id]"

      assert_select "input#recommendation_user_id[name=?]", "recommendation[user_id]"
    end
  end
end
