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
end
