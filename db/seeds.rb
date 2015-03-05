# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#Create User Types
Usertype.create(type_id: 1, type_name: "Student")
Usertype.create(type_id: 2, type_name: "Lecturer")
Usertype.create(type_id: 3, type_name: "Administrator")

# Create Students
User.create(id: 123456789, user_type_id: 1,first_name: "Joe",last_name: "Blog", 
                          email: "123456789@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 112456672, user_type_id: 1,first_name: "Will",last_name: "Murphy", 
                          email: "112456672@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 111378696 , user_type_id: 1,first_name: "Chris",last_name: "Andersen", 
                          email: "111378696 @umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 112501527, user_type_id: 1,first_name: "Olivia",last_name: "Murphy", 
                          email: "112501527@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 111385351 , user_type_id: 1,first_name: "Conor",last_name: "O'Donoghue", 
                          email: "111385351 @umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 112550207 , user_type_id: 1,first_name: "Anthony",last_name: "O Flynn", 
                          email: "112550207@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
                          
# Create Lecturers
User.create(id: 11, user_type_id: 2,first_name: "James",last_name: "Doherty", 
                          email: "jd@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 12, user_type_id: 2,first_name: "Derek",last_name: "Bridge", 
                          email: "db@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 13, user_type_id: 2,first_name: "Frank",last_name: "Boehme", 
                          email: "fb@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 14, user_type_id: 2,first_name: "Marc",last_name: "Van Dongen", 
                          email: "mvd@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 15, user_type_id: 2,first_name: "John",last_name: "Vaughan", 
                          email: "jv@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 16, user_type_id: 2,first_name: "Kieran",last_name: "Herley", 
                          email: "kh@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 17, user_type_id: 2,first_name: "Ken",last_name: "Browne", 
                          email: "kb@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)
User.create(id: 18, user_type_id: 2,first_name: "Michel",last_name: "Schellekens", 
                          email: "ms@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx", public_profile: true)     
                          
# Create Admin Account
User.create(id: 001, user_type_id: 3,first_name: "Admin",last_name: "Account", 
                          email: "admin@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx")
                          

#Create First and Second Year CS Modules
Subject.create(module_code: "CS1101", description: "System Organisation 1", lecturer_id:11, credits: 5)
Subject.create(module_code: "CS1111", description: "System Organisation 2", lecturer_id:11, credits: 5)
Subject.create(module_code: "CS1112", description: "Foundations of Computer Science 1", lecturer_id:13, credits: 5)
Subject.create(module_code: "CS1113", description: "Foundations of Computer Science 1", lecturer_id:14, credits: 5)
Subject.create(module_code: "CS1114", description: "Web Development 1", lecturer_id:15, credits: 5)
Subject.create(module_code: "CS1115", description: "Web Development 2", lecturer_id:16, credits: 5)
Subject.create(module_code: "CS1118", description: "Multimedia", lecturer_id:17,credits: 5)
Subject.create(module_code: "CS2500", description: "Software Development", lecturer_id:21, credits: 15)
Subject.create(module_code: "CS2501", description: "Database Design and Development", lecturer_id:22,credits: 5)
Subject.create(module_code: "CS2502", description: "Logic Design", lecturer_id:23, credits: 5)
Subject.create(module_code: "CS2503", description: "Operating Systems 1", lecturer_id:24, credits: 5)
Subject.create(module_code: "CS2504", description: "Algorithms and Linear Data Structures", lecturer_id:25, credits: 5)
Subject.create(module_code: "CS2505", description: "Network Computing", lecturer_id:26, credits: 5)
Subject.create(module_code: "CS2506", description: "Operating Systems 2", lecturer_id:27, credits: 5)
Subject.create(module_code: "CS2507", description: "Computer Architecture", lecturer_id:28, credits: 5)
Subject.create(module_code: "CS2509", description: "Computer Animation", lecturer_id:29, credits: 5)
Subject.create(module_code: "CS2509", description: "XML and the Extended Enterprise", lecturer_id:30, credits: 5)
Subject.create(module_code: "CS2510", description: "Web Servers", lecturer_id:31, credits: 5)
Subject.create(module_code: "CS2511", description: "Usability Engineering", lecturer_id:32, credits: 5)

