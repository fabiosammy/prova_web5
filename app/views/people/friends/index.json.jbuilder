json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :birthday, :person_id
  json.url person_friend_path(@person,friend.id,:format=>:json)
end
