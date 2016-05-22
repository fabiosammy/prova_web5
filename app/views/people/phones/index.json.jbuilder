json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :default
  json.url person_phone_url(phone.person, phone, format: :json)
end
