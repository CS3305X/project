#DROP TABLE IF EXISTS RegisteredFor CASCADE;
#DROP TABLE IF EXISTS Attending CASCADE;
#DROP TABLE IF EXISTS MemberOf CASCADE;
#DROP TABLE IF EXISTS UserGroup CASCADE;
#DROP TABLE IF EXISTS Meeting CASCADE;
#DROP TABLE IF EXISTS PersonalEvent CASCADE;
#DROP TABLE IF EXISTS ClassSchedule CASCADE;
#DROP TABLE IF EXISTS OfferedTo CASCADE;
#DROP TABLE IF EXISTS Module CASCADE;
#DROP TABLE IF EXISTS Course CASCADE;
#DROP TABLE IF EXISTS User CASCADE;
#DROP TABLE IF EXISTS UserType CASCADE;

CREATE TABLE UserType(
    type_id INT (1),
    type_name VARCHAR (15),
    PRIMARY KEY(type_id)
);

CREATE TABLE User(
    user_id INT (12),
    user_type INT (1),
    first_name VARCHAR (30),
    last_name VARCHAR (30),
    email VARCHAR (60),
    phone_num VARCHAR (30),
    password_digest VARCHAR (500),
    activated BOOL DEFAULT FALSE,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_type) REFERENCES UserType(type_id)
);

CREATE TABLE PersonalEvent(
    event_id INT NOT NULL AUTO_INCREMENT,
    user_id INT (12),
    event_name VARCHAR (50),
    description VARCHAR (500),
    location VARCHAR (100),
    start_time DATETIME,
    end_time DATETIME,
    PRIMARY KEY (event_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Module(
    module_code VARCHAR (10),
    description VARCHAR (200),
    lecturer_id INT (12),
    PRIMARY KEY (module_code),
    FOREIGN KEY (lecturer_id) REFERENCES User(user_id)
);

CREATE TABLE RegisteredFor(
    user_id INT (12),
    module_code VARCHAR (10),
    PRIMARY KEY (user_id, module_code)
);

CREATE TABLE ClassSchedule(
    module_code VARCHAR (10),
    start_time DATETIME,
    end_time DATETIME,
    location VARCHAR (100),
    cancelled BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (module_code, start_time),
    FOREIGN KEY (module_code) REFERENCES Module(module_code)
);

CREATE TABLE Course(
    course_id VARCHAR (10),
    course_name VARCHAR (100),
    PRIMARY KEY (course_id)
);

CREATE TABLE OfferedTo(
    module_code VARCHAR (10),
    course_id VARCHAR (10),
    PRIMARY KEY (module_code, course_id),
    FOREIGN KEY (module_code) REFERENCES Module(module_code),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Meeting(
    meeting_id INT (100) NOT NULL AUTO_INCREMENT,
    start_time DATETIME,
    end_time DATETIME,
    description VARCHAR (100),
    location VARCHAR (100),
    organiser_id INT (12),
    confirmed_by_all BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (meeting_id),
    FOREIGN KEY (organiser_id) REFERENCES User(user_id)
);

CREATE TABLE Attending(
    user_id INT (12),
    meeting_id INT (100),
    confirmed BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (user_id, meeting_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (meeting_id) REFERENCES Meeting(meeting_id)
);

CREATE TABLE UserGroup(
    group_id INT (100) NOT NULL AUTO_INCREMENT,
    group_name VARCHAR (100),
    description VARCHAR (500),
    admin INT (12),
    PRIMARY KEY (group_id),
    FOREIGN KEY (admin) REFERENCES User(user_id)
);

CREATE TABLE MemberOf(
    user_id INT (12),
    group_id INT (100),
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (group_id) REFERENCES UserGroup(group_id)
);
    
INSERT INTO UserType
VALUES
(1, "Student"),
(2, "Lecturer"),
(3, "Administrator");
    
    
#SAMPLE DATA
INSERT INTO User
VALUES
("112456672", 1, "Will", "Murphy", "will@email.com", "0864093776", "password", TRUE),
("112456673", 1, "Tony", "Fitz", "tony@email.com", "0864093777", "password", TRUE),
("112456674", 1, "James", "Rahilly", "james@email.com", "0864093778", "password", TRUE);

INSERT INTO PersonalEvent(user_id, event_name, description, location, start_time, end_time)
VALUES
(112456672,"Doctors Appointment", "", "College Rd", "2015/02/07 10:00:00", "2015/02/07 11:00:00"),
(112456673,"Lunch with James", "", "Main Rest", "2015/02/06 13:00:00", "2015/02/06 14:00:00"),
(112456672,"Meet Tony", "Discuss Party", "Tony's House", "2015/02/07 17:00:00", "2015/02/07 18:00:00");
