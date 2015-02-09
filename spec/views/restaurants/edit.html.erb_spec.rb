require 'rails_helper'

RSpec.describe "restaurants/edit", :type => :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "MyString",
      :description => "MyString"
    ))
  end
end
