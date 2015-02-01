require 'rails_helper'

RSpec.describe "ratings/edit", :type => :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :rate => 1,
      :user => nil,
      :restaurant => nil
    ))
  end

  it "renders the edit rating form" do
    render

    assert_select "form[action=?][method=?]", rating_path(@rating), "post" do

      assert_select "input#rating_rate[name=?]", "rating[rate]"

      assert_select "input#rating_user_id[name=?]", "rating[user_id]"

      assert_select "input#rating_restaurant_id[name=?]", "rating[restaurant_id]"
    end
  end
end
