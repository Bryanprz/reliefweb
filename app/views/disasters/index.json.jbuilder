json.array!(@disasters) do |disaster|
  json.extract! disaster, :id, :name, :date, :country, :description
  json.url disaster_url(disaster, format: :json)
end
