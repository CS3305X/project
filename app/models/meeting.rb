class Meeting < ActiveRecord::Base
  has_many :users
end
