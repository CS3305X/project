json.array!(@class_schedules) do |class_schedule|
  json.extract! class_schedule, :id, :subjects_id, :module_code, :start_time, :end_time, :location, :cancelled
  json.url class_schedule_url(class_schedule, format: :json)
end
