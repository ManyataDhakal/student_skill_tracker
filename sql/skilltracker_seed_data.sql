-- Use Database
USE student_skill_tracker;

-- Insert Sample Users
INSERT INTO users (full_name, email, password, role, status)
VALUES
('Admin User', 'admin@gmail.com', 'admin123', 'admin', 'approved'),
('Alex Johnson', 'alex@gmail.com', 'alex123', 'student', 'approved'),
('John Smith', 'john@gmail.com', 'john123', 'student', 'approved'),
('David Miller', 'david@gmail.com', 'david123', 'student', 'approved'),
('Emma Watson', 'emma@gmail.com', 'emma123', 'student', 'approved');

-- Insert Sample Skills
INSERT INTO skills (skill_name, category, description)
VALUES
('Java Programming', 'Programming', 'Core Java Concepts and OOP principles'),
('Advanced Java', 'Programming', 'Collections, Generics and Multithreading'),
('JSP and Servlets', 'Java EE', 'Dynamic web application developemnt'),
('HTML Fundamentals', 'Web Development', 'Building web page structure'),
('CSS Styling', 'Web Development', 'Interactive web application'),
('Javascript Basics', 'Web Development', 'Interactive web applications'),
('MYSQL Database', 'Database', 'Database Design and SQL queries'),
('Database Normalization', 'Database', 'Reducing data redundancy'),
('Git and Github', 'Tools', 'Version control and collaboration'),
('Software Testing', 'QA', 'Manual and automated testing');

-- Insert Sample Student Skills
INSERT INTO student_skills (user_id, skill_id, proficiency_level)
VALUES
(2, 1, 'Beginner'),
(2, 3, 'Intermediate'),
(2, 5, 'Advanced'),

(3, 1, 'Advanced'),
(3, 4, 'Intermediate'),
(3, 7, 'Beginner'),

(4, 2, 'Intermediate'),
(4, 6, 'Beginner'),
(4, 9, 'Advanced'),

(5, 3, 'Beginner'),
(5, 8, 'Intermediate'),
(5, 10, 'Advanced');
