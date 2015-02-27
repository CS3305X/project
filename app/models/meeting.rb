class Meeting < ActiveRecord::Base
  has_many :users
  attr_accessor :users
  attr_accessor :day
end
