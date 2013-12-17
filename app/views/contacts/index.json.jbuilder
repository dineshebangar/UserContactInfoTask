json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :description, :dob
  json.url contact_url(contact, format: :json)
end
