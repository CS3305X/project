json.array!(@users) do |user|
  json.extract! user, :id, :user_type_id, :user_id, :first_name, :last_name, :email, :phone_num, :password_digest, :activated
  json.url user_url(user, format: :json)
end
