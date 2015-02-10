class Course < ActiveRecord::Base
  has_many :subjects
end
