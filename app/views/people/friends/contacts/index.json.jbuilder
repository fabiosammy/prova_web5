json.array!(@contacts) do |contact|
  json.extract! contact, :id, :tipo, :valor
  json.url person_url(contact, format: :json)
end
