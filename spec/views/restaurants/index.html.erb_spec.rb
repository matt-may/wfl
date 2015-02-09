require 'rails_helper'

RSpec.describe "restaurants/index", :type => :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :description => "Description"
      ),
      Restaurant.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end
end
