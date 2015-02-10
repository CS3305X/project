json.array!(@subjects) do |subject|
  json.extract! subject, :id, :user, :module_code, :description, :lecturer_id
  json.url subject_url(subject, format: :json)
end
