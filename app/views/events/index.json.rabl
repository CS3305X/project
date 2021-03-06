collection @events
attributes :id, :name,  :start, :finish, :all_day,:user_id

node(:title)   { |event| event.name                 }
node(:start)   { |event| event.start.to_s(:rfc822)  }
node(:end)     { |event| event.finish.to_s(:rfc822) }
node(:url)     { |event| edit_event_url(event)      }
node(:allDay)  { |event| event.all_day              }
node(:user_id) { |event| event.user_id             }

node(:color) do |event|
  '#920202'
end

node(:update) { |event| event_url(event) }
