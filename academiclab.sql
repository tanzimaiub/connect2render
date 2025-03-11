
Create database auth_system;

use auth_system; 

-- Create users1 table
CREATE TABLE adminlogin (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

-- Create users1 table
CREATE TABLE users1 (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

-- Create education table with composite primary key (degree, institute) and foreign key reference to users1
CREATE TABLE education (
    username VARCHAR(255),
    degree VARCHAR(255),
    institute VARCHAR(255),
    PRIMARY KEY (degree, institute),  -- Composite primary key
    FOREIGN KEY (username) REFERENCES users1(username) ON DELETE CASCADE
);

-- Insert users into users1
INSERT INTO users1 (username, password) VALUES
    ('Tim', 'password1'),
    ('Tasnim', 'password2'),
    ('Tanha', 'password3');

-- Insert education records linked to users1
INSERT INTO education (username, degree, institute) VALUES
    ('Tim', 'Bachelor of Computer Science', 'Monash University Malaysia'),
    ('Tasnim','Bachelor of Business Administration', 'Monash University Malaysia'),
    ('Tanha','Bachelor of Engineering', 'Monash University Malaysia');


CREATE TABLE userinfo (
    username VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    degree VARCHAR(255),
    institute VARCHAR(255),
    PRIMARY KEY (username),
    FOREIGN KEY (username) REFERENCES users1(username) ON DELETE CASCADE,
    FOREIGN KEY (degree, institute) REFERENCES education(degree, institute) ON DELETE CASCADE
);

INSERT INTO userinfo (username, email, gender, degree, institute) VALUES
    ('Tim', 'tim123@example.com', 'Male', 'Bachelor of Computer Science', 'Monash University Malaysia'),
    ('Tasnim', 'tasnim456@example.com', 'Female', 'Bachelor of Business Administration', 'Monash University Malaysia'),
    ('Tanha', 'tanha789@example.com', 'Female', 'Bachelor of Engineering', 'Monash University Malaysia');
