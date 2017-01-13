json.array!(@reading_lists) do |reading_list|
  json.extract! reading_list, :id, :person_id, :paper_id, :reading_list_folder_id
  json.url reading_list_url(reading_list, format: :json)
end
