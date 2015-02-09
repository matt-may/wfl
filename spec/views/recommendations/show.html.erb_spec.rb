require 'rails_helper'

RSpec.describe "recommendations/show", :type => :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      :restaurant => nil,
      :user => nil
    ))
  end
end
