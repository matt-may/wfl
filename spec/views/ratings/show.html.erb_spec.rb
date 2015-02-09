require 'rails_helper'

RSpec.describe "ratings/show", :type => :view do
  before(:each) do
    @rating = assign(:rating, Rating.create!(
      :rate => 1,
      :user => nil,
      :restaurant => nil
    ))
  end
end
