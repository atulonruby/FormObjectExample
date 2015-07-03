json.array!(@stations) do |station|
  json.extract! station, :id, :name, :description
  json.url station_url(station, format: :json)
end
