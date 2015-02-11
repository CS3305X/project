class User < ActiveRecord::Base
  belongs_to :usertype
  has_many :personal_events
  has_many :subjects
  has_many :meetings
  has_many :user_groups
  # Make sure the User has a valid first and second name.
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, length: { maximum: 255 },
  #                  format: { with: VALID_EMAIL_REGEX }
  
  #Ensure the user has a secure password
  has_secure_password
  validates :password, length: { minimum: 6 }
end
