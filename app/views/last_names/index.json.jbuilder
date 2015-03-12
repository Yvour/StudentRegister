json.array!(@last_names) do |last_name|
  json.extract! last_name, :id, :name
  json.url last_name_url(last_name, format: :json)
end
