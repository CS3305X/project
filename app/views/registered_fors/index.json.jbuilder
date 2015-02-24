json.array!(@registered_fors) do |registered_for|
  json.extract! registered_for, :id, :user_id, :module_code
  json.url registered_for_url(registered_for, format: :json)
end
