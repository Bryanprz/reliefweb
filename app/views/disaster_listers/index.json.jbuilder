json.array!(@disaster_listers) do |disaster_lister|
  json.extract! disaster_lister, :id
  json.url disaster_lister_url(disaster_lister, format: :json)
end
