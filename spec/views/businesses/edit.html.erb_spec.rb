require 'spec_helper'

describe "businesses/edit" do
  before(:each) do
    @business = assign(:business, stub_model(Business,
      :id => "MyString",
      :name => "MyString",
      :image_url => "MyString",
      :display_phone => "MyString",
      :review_count => 1,
      :rating_img_url => "MyString",
      :snippet_text => "MyString",
      :location_address => "MyString",
      :location_city => "MyString",
      :location_state => "MyString",
      :location_postal => "MyString"
    ))
  end

  it "renders the edit business form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", business_path(@business), "post" do
      assert_select "input#business_id[name=?]", "business[id]"
      assert_select "input#business_name[name=?]", "business[name]"
      assert_select "input#business_image_url[name=?]", "business[image_url]"
      assert_select "input#business_display_phone[name=?]", "business[display_phone]"
      assert_select "input#business_review_count[name=?]", "business[review_count]"
      assert_select "input#business_rating_img_url[name=?]", "business[rating_img_url]"
      assert_select "input#business_snippet_text[name=?]", "business[snippet_text]"
      assert_select "input#business_location_address[name=?]", "business[location_address]"
      assert_select "input#business_location_city[name=?]", "business[location_city]"
      assert_select "input#business_location_state[name=?]", "business[location_state]"
      assert_select "input#business_location_postal[name=?]", "business[location_postal]"
    end
  end
end
