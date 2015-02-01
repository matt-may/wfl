require 'rails_helper'

RSpec.describe "restaurants/new", :type => :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_description[name=?]", "restaurant[description]"
    end
  end
end
