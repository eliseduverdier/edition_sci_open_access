json.array!(@keywords) do |keyword|
  json.extract! keyword, :id, :paper_id, :keyword
  json.url keyword_url(keyword, format: :json)
end
