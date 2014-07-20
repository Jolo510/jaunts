json.array!(@businesses) do |business|
  json.extract! business, :id, :yelp_id, :name, :image, :display_phone, :review_count, :rating_img, :snippet_text, :location_address, :location_city, :location_state, :location_postal
  json.url business_url(business, format: :json)
end
