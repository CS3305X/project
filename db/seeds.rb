# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Usertype.create(type_id: 1, type_name: "Student")
Usertype.create(type_id: 2, type_name: "Lecturer")
Usertype.create(type_id: 3, type_name: "Administrator")

User.create(user_type_id: 1,first_name: "Test",last_name: "User", 
                          email: "123456789@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx")
user = User.find_by(email: "123456789@umail.ucc.ie")
user.id = 123456789

