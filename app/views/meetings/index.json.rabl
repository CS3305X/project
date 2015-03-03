collection @meetings
attributes :description,  :start_time, :end_time

node(:title)   { |meeting| meeting.description                 }
node(:start)   { |meeting| meeting.start_time.to_s(:rfc822)  }
node(:end)     { |meeting| meeting.end_time.to_s(:rfc822) }


node(:color) do |meeting|
  '#6f9980'
end


