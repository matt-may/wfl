require 'rails_helper'

RSpec.describe "ratings/new", :type => :view do
  before(:each) do
    assign(:rating, Rating.new(
      :rate => 1,
      :user => nil,
      :restaurant => nil
    ))
  end

  it "renders new rating form" do
    render

    assert_select "form[action=?][method=?]", ratings_path, "post" do

      assert_select "input#rating_rate[name=?]", "rating[rate]"

      assert_select "input#rating_user_id[name=?]", "rating[user_id]"

      assert_select "input#rating_restaurant_id[name=?]", "rating[restaurant_id]"
    end
  end
end
