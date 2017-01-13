json.array!(@people) do |person|
  json.extract! person, :id, :email, :firstname, :lastname, :status, :bio, :level, :country, :academia_url, :research_gate_url
  json.url person_url(person, format: :json)
end
