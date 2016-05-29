json.array!(@phones) do |phone|
  json.extract! phone, :id, :number, :default, :person_id
end
