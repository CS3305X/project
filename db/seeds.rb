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

