json.array!(@papers) do |paper|
  json.extract! paper, :id, :paper_type, :title, :abstract, :status, :tex_content, :html_content, :pdf_url, :category_id
  json.url paper_url(paper, format: :json)
end
