json.array!(@contacts) do |contact|
  json.extract! contact, :id, :tipo, :valor
  json.url person_friend_contact_url(contact.friend.person, contact.friend, contact)
end
