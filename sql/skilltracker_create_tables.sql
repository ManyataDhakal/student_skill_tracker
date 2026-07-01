-- Use Database
USE student_skill_tracker;

-- DROP existing tables for a clean install
DROP TABLE IF EXISTS student_skills;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS users;

-- Users table
CREATE TABLE users (
id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
full_name varchar(100) NOT NULL,
email varchar(100) NOT NULL UNIQUE,
password varchar(255) NOT NULL,
role varchar(20) DEFAULT 'student',
status varchar(20) DEFAULT 'approved',
created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Skills table
CREATE TABLE skills(id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
skill_name varchar(100) NOT NULL,
category varchar(100) NOT NULL,
description text,
created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Student skills table
CREATE TABLE student_skills (
id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id int(11) NOT NULL,
skill_id int(11) NOT NULL,
proficiency_level varchar(50) DEFAULT 'Beginner',
progress int(11) DEFAULT 0,
created_at timestamp DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);
