require 'rails_helper'

RSpec.describe "ratings/new", :type => :view do
  before(:each) do
    user = create(:user)
    sign_in user

    assign(:restaurant, create(:restaurant))
    assign(:rating, Rating.new(
      :rate => 1,
      :user => user,
      :restaurant => nil
    ))
  end
end
