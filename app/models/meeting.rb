class Meeting < ActiveRecord::Base
  has_many :users
  attr_accessor :users
  attr_accessor :day
  attr_accessor :algorithm
  attr_accessor :start_time
  attr_accessor :end_time
  attr_accessor :organiser_id
end
