require 'spec_helper'

describe "trips/edit" do
  before(:each) do
    @trip = assign(:trip, stub_model(Trip,
      :name => "MyString",
      :description => "MyString",
      :json => "MyString",
      :user_id => 1,
      :rating => 1
    ))
  end

  it "renders the edit trip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trip_path(@trip), "post" do
      assert_select "input#trip_name[name=?]", "trip[name]"
      assert_select "input#trip_description[name=?]", "trip[description]"
      assert_select "input#trip_json[name=?]", "trip[json]"
      assert_select "input#trip_user_id[name=?]", "trip[user_id]"
      assert_select "input#trip_rating[name=?]", "trip[rating]"
    end
  end
end
