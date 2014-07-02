json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :description, :json, :user_id, :rating
  json.url trip_url(trip, format: :json)
end
