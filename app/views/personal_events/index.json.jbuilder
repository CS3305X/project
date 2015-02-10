json.array!(@personal_events) do |personal_event|
  json.extract! personal_event, :id, :user_id, :event_name, :description, :location, :start_time, :end_time
  json.url personal_event_url(personal_event, format: :json)
end
