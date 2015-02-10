json.array!(@user_groups) do |user_group|
  json.extract! user_group, :id, :group_name, :description, :admin_id
  json.url user_group_url(user_group, format: :json)
end
