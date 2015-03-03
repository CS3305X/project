collection @class_schedules
attributes :module_code, :start_time, :end_time

node(:title)   { |class_schedule| class_schedule.title              }
node(:start)   { |class_schedule| class_schedule.start_time.to_s(:rfc822)  }
node(:end)     { |class_schedule| class_schedule.end_time.to_s(:rfc822) }

node(:color) do |class_schedule|
   '#538DE6'
end


