require 'rails_helper'

RSpec.describe "recommendations/new", :type => :view do
  before(:each) do
    assign(:recommendation, Recommendation.new(
      :restaurant => nil,
      :user => nil
    ))
  end
end
