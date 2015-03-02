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

# Create the intial test user
User.create(id: 123456789, user_type_id: 1,first_name: "Test",last_name: "User", 
                          email: "123456789@umail.ucc.ie", phone_num: "353871234567", password: "teamprojectx", password_confirmation: "teamprojectx")

#Create First Year Subjects
<<<<<<< HEAD
Subject.create(module_code: "cs1101", description: "System Organisation 1", lecturer_id:11)
Subject.create(module_code: "cs1111", description: "System Organisation 2", lecturer_id:12)
Subject.create(module_code: "cs1112", description: "Foundations of Computer Science 1", lecturer_id:13)
Subject.create(module_code: "cs1113", description: "Foundations of Computer Science 1", lecturer_id:14)
Subject.create(module_code: "cs1114", description: "Web Development 1", lecturer_id:15)
Subject.create(module_code: "cs1115", description: "Web Development 2", lecturer_id:16)
Subject.create(module_code: "cs1118", description: "Multimedia", lecturer_id:17)

#Create Second Year Subjects
Subject.create(module_code: "cs2500", description: "Software Development", lecturer_id:21)
Subject.create(module_code: "cs2501", description: "Database Design and Development", lecturer_id:22)
Subject.create(module_code: "cs2502", description: "Logic Design", lecturer_id:23)
Subject.create(module_code: "cs2503", description: "Operating Systems 1", lecturer_id:24)
Subject.create(module_code: "cs2504", description: "Algorithms and Linear Data Structures", lecturer_id:25)
Subject.create(module_code: "cs2505", description: "Network Computing", lecturer_id:26)
Subject.create(module_code: "cs2506", description: "Operating Systems 2", lecturer_id:27)
Subject.create(module_code: "cs2507", description: "Computer Architecture", lecturer_id:28)
Subject.create(module_code: "cs2509", description: "Computer Animation", lecturer_id:29)
Subject.create(module_code: "cs2509", description: "XML and the Extended Enterprise", lecturer_id:30)
Subject.create(module_code: "cs2510", description: "Web Servers", lecturer_id:31)
Subject.create(module_code: "cs2511", description: "Usability Engineering", lecturer_id:32)
=======
Subject.create(module_code: "cs1101", description: "System Organisation 1", lecturer_id:11, credits: 5)
Subject.create(module_code: "cs1111", description: "System Organisation 2", lecturer_id:12, credits: 5)
Subject.create(module_code: "cs1112", description: "Foundations of Computer Science 1", lecturer_id:13, credits: 5)
Subject.create(module_code: "cs1113", description: "Foundations of Computer Science 1", lecturer_id:14, credits: 5)
Subject.create(module_code: "cs1114", description: "Web Development 1", lecturer_id:15, credits: 5)
Subject.create(module_code: "cs1115", description: "Web Development 2", lecturer_id:16, credits: 5)
Subject.create(module_code: "cs1118", description: "Multimedia", lecturer_id:17,credits: 5)

#Create Second Year Subjects
Subject.create(module_code: "cs2500", description: "Software Development", lecturer_id:21, credits: 15)
Subject.create(module_code: "cs2501", description: "Database Design and Development", lecturer_id:22,credits: 5)
Subject.create(module_code: "cs2502", description: "Logic Design", lecturer_id:23, credits: 5)
Subject.create(module_code: "cs2503", description: "Operating Systems 1", lecturer_id:24, credits: 5)
Subject.create(module_code: "cs2504", description: "Algorithms and Linear Data Structures", lecturer_id:25, credits: 5)
Subject.create(module_code: "cs2505", description: "Network Computing", lecturer_id:26, credits: 5)
Subject.create(module_code: "cs2506", description: "Operating Systems 2", lecturer_id:27, credits: 5)
Subject.create(module_code: "cs2507", description: "Computer Architecture", lecturer_id:28, credits: 5)
Subject.create(module_code: "cs2509", description: "Computer Animation", lecturer_id:29, credits: 5)
Subject.create(module_code: "cs2509", description: "XML and the Extended Enterprise", lecturer_id:30, credits: 5)
Subject.create(module_code: "cs2510", description: "Web Servers", lecturer_id:31, credits: 5)
Subject.create(module_code: "cs2511", description: "Usability Engineering", lecturer_id:32, credits: 5)
>>>>>>> 0d6de95403cbe7406d148f644badb53d37c6f824

#Create Third Year Subjects

#Class_Schedule.create( module_code:"cs1101", start_time:"2015-26-02 13:00:00", end_time:"2015-26-02 14:00:00")
#Class_Schedule.create( module_code:"cs1111", start_time:"2015-26-02 12:00:00", end_time:"2015-26-02 13:00:00")
#Class_Schedule.create( module_code:"cs1112", start_time:"2015-26-02 14:00:00", end_time:"2015-26-02 15:00:00")
#Class_Schedule.create( module_code:"cs1113", start_time:"2015-26-02 15:00:00", end_time:"2015-26-02 16:00:00")
#Class_Schedule.create( module_code:"cs1114", start_time:"2015-27-02 13:00:00", end_time:"2015-27-02 14:00:00")
#Class_Schedule.create( module_code:"cs1115", start_time:"2015-26-02 14:00:00", end_time:"2015-26-02 15:00:00")
<<<<<<< HEAD
#Class_Schedule.create( module_code:"cs1118", start_time:"2015-26-02 15:00:00", end_time:"2015-26-02 16:00:00")
=======
#Class_Schedule.create( module_code:"cs1118", start_time:"2015-26-02 15:00:00", end_time:"2015-26-02 16:00:00")
>>>>>>> 0d6de95403cbe7406d148f644badb53d37c6f824
