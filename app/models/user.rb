class User < ActiveRecord::Base
  belongs_to :usertype
  has_many :personal_events
  has_many :subjects
  has_many :meetings
  has_many :user_groups
  has_many :registered_fors
  
  #Ensure the ID only aceptd digits between 0-9
  validates :id, format: { with: /([\d])+/,
    message: "Student ID must be a number" }
  
  # Make sure the User has a valid first and second name.
  validates :first_name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }

  #Ensure the user has a secure password
  has_secure_password
  validates :password, length: { minimum: 6 }, confirmation: true 
  validates :password_confirmation, presence: true
  
  validates :user_type_id, presence: true
end
