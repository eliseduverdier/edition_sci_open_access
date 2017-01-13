json.array!(@reading_list_folders) do |reading_list_folder|
  json.extract! reading_list_folder, :id, :name
  json.url reading_list_folder_url(reading_list_folder, format: :json)
end
