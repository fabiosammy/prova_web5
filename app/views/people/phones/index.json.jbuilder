json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :default, :person_id
  json.url person_phone_path(@person,phone.id,:format=>:json)
end
