json.array!(@authors) do |author|
  json.extract! author, :id, :person_id, :paper_id, :status
  json.url author_url(author, format: :json)
end
