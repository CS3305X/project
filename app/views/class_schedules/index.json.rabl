collection @class_schedules
attributes :module_code, :start_time, :end_time

node(:title)   { |class_schedule| class_schedule.module_code               }
node(:start_time)   { |class_schedule| class_schedule.start_time.to_s(:rfc822)  }
node(:end_time)     { |class_schedule| class_schedule.end_time.to_s(:rfc822) }

node(:color) do |class_schedule|
  class_schedule.start_time - 3.days < Time.now ? '#920202' : '#00AEEF'
end


