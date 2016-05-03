json.array!(@contacts) do |contact|
  json.extract! contact, :id, :type_, :value, :friend_id
  json.url person_friend_contact_path(@person,@friend,contact.id,:format =>:json)
end
