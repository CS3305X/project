{"filter":false,"title":"schema.rb","tooltip":"/db/schema.rb","undoManager":{"mark":69,"position":69,"stack":[[{"group":"doc","deltas":[{"start":{"row":103,"column":0},"end":{"row":105,"column":5},"action":"remove","lines":["  create_table \"UserType\", primary_key: \"type_id\", force: true do |t|","    t.string \"type_name\", limit: 15","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":14,"column":0},"end":{"row":15,"column":0},"action":"insert","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":15,"column":0},"end":{"row":17,"column":5},"action":"insert","lines":["  create_table \"UserType\", primary_key: \"type_id\", force: true do |t|","    t.string \"type_name\", limit: 15","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":5},"end":{"row":18,"column":0},"action":"insert","lines":["",""]},{"start":{"row":18,"column":0},"end":{"row":18,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":87,"column":0},"end":{"row":97,"column":67},"action":"remove","lines":["  create_table \"User\", primary_key: \"user_id\", force: true do |t|","    t.integer \"user_type\"","    t.string  \"first_name\",      limit: 30","    t.string  \"last_name\",       limit: 30","    t.string  \"email\",           limit: 60","    t.string  \"phone_num\",       limit: 30","    t.string  \"password_digest\", limit: 500","    t.boolean \"activated\",                   default: false","  end","","  add_index \"User\", [\"user_type\"], name: \"user_type\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":17,"column":5},"end":{"row":18,"column":0},"action":"insert","lines":["",""]},{"start":{"row":18,"column":0},"end":{"row":18,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":18,"column":2},"end":{"row":19,"column":0},"action":"insert","lines":["",""]},{"start":{"row":19,"column":0},"end":{"row":19,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":19,"column":2},"end":{"row":29,"column":67},"action":"insert","lines":["  create_table \"User\", primary_key: \"user_id\", force: true do |t|","    t.integer \"user_type\"","    t.string  \"first_name\",      limit: 30","    t.string  \"last_name\",       limit: 30","    t.string  \"email\",           limit: 60","    t.string  \"phone_num\",       limit: 30","    t.string  \"password_digest\", limit: 500","    t.boolean \"activated\",                   default: false","  end","","  add_index \"User\", [\"user_type\"], name: \"user_type\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":19,"column":2},"end":{"row":19,"column":3},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":19,"column":0},"end":{"row":19,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":83,"column":0},"end":{"row":92,"column":72},"action":"remove","lines":["  create_table \"PersonalEvent\", primary_key: \"event_id\", force: true do |t|","    t.integer  \"user_id\"","    t.string   \"event_name\",  limit: 50","    t.string   \"description\", limit: 500","    t.string   \"location\",    limit: 100","    t.datetime \"start_time\"","    t.datetime \"end_time\"","  end","","  add_index \"PersonalEvent\", [\"user_id\"], name: \"user_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":29,"column":67},"end":{"row":30,"column":0},"action":"insert","lines":["",""]},{"start":{"row":30,"column":0},"end":{"row":30,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":30,"column":2},"end":{"row":31,"column":0},"action":"insert","lines":["",""]},{"start":{"row":31,"column":0},"end":{"row":31,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":31,"column":2},"end":{"row":40,"column":72},"action":"insert","lines":["  create_table \"PersonalEvent\", primary_key: \"event_id\", force: true do |t|","    t.integer  \"user_id\"","    t.string   \"event_name\",  limit: 50","    t.string   \"description\", limit: 500","    t.string   \"location\",    limit: 100","    t.datetime \"start_time\"","    t.datetime \"end_time\"","  end","","  add_index \"PersonalEvent\", [\"user_id\"], name: \"user_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":31,"column":2},"end":{"row":31,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":31,"column":0},"end":{"row":31,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":31,"column":0},"end":{"row":31,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":80,"column":0},"end":{"row":85,"column":73},"action":"remove","lines":["  create_table \"Module\", primary_key: \"module_code\", force: true do |t|","    t.string  \"description\", limit: 200","    t.integer \"lecturer_id\"","  end","","  add_index \"Module\", [\"lecturer_id\"], name: \"lecturer_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":40,"column":72},"end":{"row":41,"column":0},"action":"insert","lines":["",""]},{"start":{"row":41,"column":0},"end":{"row":41,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":41,"column":2},"end":{"row":42,"column":0},"action":"insert","lines":["",""]},{"start":{"row":42,"column":0},"end":{"row":42,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":42,"column":2},"end":{"row":47,"column":73},"action":"insert","lines":["  create_table \"Module\", primary_key: \"module_code\", force: true do |t|","    t.string  \"description\", limit: 200","    t.integer \"lecturer_id\"","  end","","  add_index \"Module\", [\"lecturer_id\"], name: \"lecturer_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":42,"column":2},"end":{"row":42,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":98,"column":0},"end":{"row":101,"column":5},"action":"remove","lines":["  create_table \"RegisteredFor\", id: false, force: true do |t|","    t.integer \"user_id\",                default: 0,  null: false","    t.string  \"module_code\", limit: 10, default: \"\", null: false","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":48,"column":2},"end":{"row":49,"column":0},"action":"insert","lines":["",""]},{"start":{"row":49,"column":0},"end":{"row":49,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":49,"column":2},"end":{"row":52,"column":5},"action":"insert","lines":["  create_table \"RegisteredFor\", id: false, force: true do |t|","    t.integer \"user_id\",                default: 0,  null: false","    t.string  \"module_code\", limit: 10, default: \"\", null: false","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":52,"column":5},"end":{"row":53,"column":0},"action":"insert","lines":["",""]},{"start":{"row":53,"column":0},"end":{"row":53,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":49,"column":2},"end":{"row":49,"column":4},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":62,"column":2},"end":{"row":68,"column":5},"action":"remove","lines":["create_table \"ClassSchedule\", id: false, force: true do |t|","    t.string   \"module_code\", limit: 10,  default: \"\",    null: false","    t.datetime \"start_time\",                              null: false","    t.datetime \"end_time\"","    t.string   \"location\",    limit: 100","    t.boolean  \"cancelled\",               default: false","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":53,"column":2},"end":{"row":54,"column":0},"action":"insert","lines":["",""]},{"start":{"row":54,"column":0},"end":{"row":54,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":54,"column":2},"end":{"row":60,"column":5},"action":"insert","lines":["create_table \"ClassSchedule\", id: false, force: true do |t|","    t.string   \"module_code\", limit: 10,  default: \"\",    null: false","    t.datetime \"start_time\",                              null: false","    t.datetime \"end_time\"","    t.string   \"location\",    limit: 100","    t.boolean  \"cancelled\",               default: false","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":60,"column":5},"end":{"row":61,"column":0},"action":"insert","lines":["",""]},{"start":{"row":61,"column":0},"end":{"row":61,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":2},"end":{"row":74,"column":5},"action":"remove","lines":["create_table \"Course\", primary_key: \"course_id\", force: true do |t|","    t.string \"course_name\", limit: 100","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":61,"column":2},"end":{"row":62,"column":0},"action":"insert","lines":["",""]},{"start":{"row":62,"column":0},"end":{"row":62,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":62,"column":2},"end":{"row":64,"column":5},"action":"insert","lines":["create_table \"Course\", primary_key: \"course_id\", force: true do |t|","    t.string \"course_name\", limit: 100","  end"]}]}],[{"group":"doc","deltas":[{"start":{"row":64,"column":5},"end":{"row":65,"column":0},"action":"insert","lines":["",""]},{"start":{"row":65,"column":0},"end":{"row":65,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":97,"column":0},"end":{"row":103,"column":72},"action":"remove","lines":["","  create_table \"OfferedTo\", id: false, force: true do |t|","    t.string \"module_code\", limit: 10, default: \"\", null: false","    t.string \"course_id\",   limit: 10, default: \"\", null: false","  end","","  add_index \"OfferedTo\", [\"course_id\"], name: \"course_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":65,"column":2},"end":{"row":66,"column":0},"action":"insert","lines":["",""]},{"start":{"row":66,"column":0},"end":{"row":66,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":66,"column":2},"end":{"row":72,"column":72},"action":"insert","lines":["","  create_table \"OfferedTo\", id: false, force: true do |t|","    t.string \"module_code\", limit: 10, default: \"\", null: false","    t.string \"course_id\",   limit: 10, default: \"\", null: false","  end","","  add_index \"OfferedTo\", [\"course_id\"], name: \"course_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":72},"end":{"row":73,"column":0},"action":"insert","lines":["",""]},{"start":{"row":73,"column":0},"end":{"row":73,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":86,"column":1},"end":{"row":95,"column":76},"action":"remove","lines":[" create_table \"Meeting\", primary_key: \"meeting_id\", force: true do |t|","    t.datetime \"start_time\"","    t.datetime \"end_time\"","    t.string   \"description\",      limit: 100","    t.string   \"location\",         limit: 100","    t.integer  \"organiser_id\"","    t.boolean  \"confirmed_by_all\",             default: false","  end","","  add_index \"Meeting\", [\"organiser_id\"], name: \"organiser_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":72,"column":72},"end":{"row":73,"column":0},"action":"insert","lines":["",""]},{"start":{"row":73,"column":0},"end":{"row":73,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":73,"column":2},"end":{"row":74,"column":0},"action":"insert","lines":["",""]},{"start":{"row":74,"column":0},"end":{"row":74,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":74,"column":2},"end":{"row":83,"column":76},"action":"insert","lines":[" create_table \"Meeting\", primary_key: \"meeting_id\", force: true do |t|","    t.datetime \"start_time\"","    t.datetime \"end_time\"","    t.string   \"description\",      limit: 100","    t.string   \"location\",         limit: 100","    t.integer  \"organiser_id\"","    t.boolean  \"confirmed_by_all\",             default: false","  end","","  add_index \"Meeting\", [\"organiser_id\"], name: \"organiser_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":74,"column":2},"end":{"row":74,"column":3},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":96,"column":0},"end":{"row":104,"column":69},"action":"remove","lines":[""," ","","  create_table \"MemberOf\", id: false, force: true do |t|","    t.integer \"user_id\",  default: 0, null: false","    t.integer \"group_id\", default: 0, null: false","  end","","  add_index \"MemberOf\", [\"group_id\"], name: \"group_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":101,"column":0},"end":{"row":102,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":100,"column":0},"end":{"row":101,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":99,"column":0},"end":{"row":100,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":98,"column":0},"end":{"row":99,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":100,"column":0},"end":{"row":101,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":99,"column":0},"end":{"row":100,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":98,"column":0},"end":{"row":99,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":97,"column":0},"end":{"row":98,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":96,"column":0},"end":{"row":97,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":95,"column":2},"end":{"row":96,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":95,"column":0},"end":{"row":95,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":94,"column":0},"end":{"row":95,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":93,"column":2},"end":{"row":94,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":93,"column":0},"end":{"row":93,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":92,"column":0},"end":{"row":93,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":91,"column":74},"end":{"row":92,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":99,"column":64},"end":{"row":100,"column":0},"action":"insert","lines":["",""]},{"start":{"row":100,"column":0},"end":{"row":100,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":100,"column":2},"end":{"row":101,"column":0},"action":"insert","lines":["",""]},{"start":{"row":101,"column":0},"end":{"row":101,"column":2},"action":"insert","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":101,"column":2},"end":{"row":109,"column":69},"action":"insert","lines":[""," ","","  create_table \"MemberOf\", id: false, force: true do |t|","    t.integer \"user_id\",  default: 0, null: false","    t.integer \"group_id\", default: 0, null: false","  end","","  add_index \"MemberOf\", [\"group_id\"], name: \"group_id\", using: :btree"]}]}],[{"group":"doc","deltas":[{"start":{"row":102,"column":1},"end":{"row":103,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":102,"column":0},"end":{"row":102,"column":1},"action":"remove","lines":[" "]}]}],[{"group":"doc","deltas":[{"start":{"row":101,"column":2},"end":{"row":102,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":101,"column":0},"end":{"row":101,"column":2},"action":"remove","lines":["  "]}]}],[{"group":"doc","deltas":[{"start":{"row":100,"column":2},"end":{"row":101,"column":0},"action":"remove","lines":["",""]}]}],[{"group":"doc","deltas":[{"start":{"row":100,"column":0},"end":{"row":100,"column":2},"action":"remove","lines":["  "]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":100,"column":0},"end":{"row":100,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1423152437927,"hash":"12911b948a90405855009873b31272a0c5a073bc"}