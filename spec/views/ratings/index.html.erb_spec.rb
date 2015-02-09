require 'rails_helper'

RSpec.describe "ratings/index", :type => :view do
  before(:each) do
    assign(:ratings, [
      Rating.create!(
        :rate => 1,
        :user => nil,
        :restaurant => nil
      ),
      Rating.create!(
        :rate => 1,
        :user => nil,
        :restaurant => nil
      )
    ])
  end
end
