json.array!(@reviews) do |review|
  json.extract! review, :id, :person_id, :paper_id, :status, :content
  json.url review_url(review, format: :json)
end
