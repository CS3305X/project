json.array!(@subjects) do |subject|
  json.extract! subject, :id, :module_code, :description, :lecturer_id, :credits
  json.url subject_url(subject, format: :json)
end
