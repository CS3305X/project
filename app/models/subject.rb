class Subject < ActiveRecord::Base
  has_many :users
  has_many :class_schedules
  has_many :courses
end
