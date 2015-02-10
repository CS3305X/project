json.array!(@usertypes) do |usertype|
  json.extract! usertype, :id, :type_id, :type_name#
  json.url usertype_url(usertype, format: :json)
end
