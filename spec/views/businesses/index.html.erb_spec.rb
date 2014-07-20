require 'spec_helper'

describe "businesses/index" do
  before(:each) do
    assign(:businesses, [
      stub_model(Business,
        :yelp_id => "Yelp",
        :name => "Name",
        :image => "",
        :display_phone => "Display Phone",
        :review_count => 1,
        :rating_img => "",
        :snippet_text => "Snippet Text",
        :location_address => "Location Address",
        :location_city => "Location City",
        :location_state => "Location State",
        :location_postal => "Location Postal"
      ),
      stub_model(Business,
        :yelp_id => "Yelp",
        :name => "Name",
        :image => "",
        :display_phone => "Display Phone",
        :review_count => 1,
        :rating_img => "",
        :snippet_text => "Snippet Text",
        :location_address => "Location Address",
        :location_city => "Location City",
        :location_state => "Location State",
        :location_postal => "Location Postal"
      )
    ])
  end

  it "renders a list of businesses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Yelp".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Display Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Snippet Text".to_s, :count => 2
    assert_select "tr>td", :text => "Location Address".to_s, :count => 2
    assert_select "tr>td", :text => "Location City".to_s, :count => 2
    assert_select "tr>td", :text => "Location State".to_s, :count => 2
    assert_select "tr>td", :text => "Location Postal".to_s, :count => 2
  end
end
