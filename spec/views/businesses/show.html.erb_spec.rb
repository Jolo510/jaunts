require 'spec_helper'

describe "businesses/show" do
  before(:each) do
    @business = assign(:business, stub_model(Business,
      :yelp_id => "Yelp",
      :name => "Name",
      :image_url => "Image Url",
      :display_phone => "Display Phone",
      :review_count => 1,
      :rating_img_url => "Rating Img Url",
      :snippet_text => "Snippet Text",
      :location_address => "Location Address",
      :location_city => "Location City",
      :location_state => "Location State",
      :location_postal => "Location Postal"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Yelp/)
    rendered.should match(/Name/)
    rendered.should match(/Image Url/)
    rendered.should match(/Display Phone/)
    rendered.should match(/1/)
    rendered.should match(/Rating Img Url/)
    rendered.should match(/Snippet Text/)
    rendered.should match(/Location Address/)
    rendered.should match(/Location City/)
    rendered.should match(/Location State/)
    rendered.should match(/Location Postal/)
  end
end
