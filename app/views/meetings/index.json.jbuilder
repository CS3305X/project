json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :start_time, :end_time, :description, :location, :organiser_id, :confirmed_by_all
  json.url meeting_url(meeting, format: :json)
end
