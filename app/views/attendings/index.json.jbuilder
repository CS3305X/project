json.array!(@attendings) do |attending|
  json.extract! attending, :id, :user_id, :meeting_id, :confirmed
  json.url attending_url(attending, format: :json)
end
