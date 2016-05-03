json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :birthday, :person_id
  json.url friend_url(friend, format: :json)
end
