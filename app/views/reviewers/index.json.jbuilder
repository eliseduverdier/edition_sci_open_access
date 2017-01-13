json.array!(@reviewers) do |reviewer|
  json.extract! reviewer, :id, :person_id, :paper_id, :status, :content
  json.url reviewer_url(reviewer, format: :json)
end
