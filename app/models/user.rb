class User < ActiveRecord::Base
  belongs_to :usertype
  has_many :personal_events
  has_many :subjects
  has_many :meetings
  has_many :user_groups
end
