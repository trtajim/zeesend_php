CREATE DATABASE IF NOT EXISTS tajimzdb;
USE tajimzdb;

CREATE TABLE IF NOT EXISTS userinfo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    fcm VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS chatRoom (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    last_message TEXT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user1_id) REFERENCES userinfo(id),
    FOREIGN KEY (user2_id) REFERENCES userinfo(id)
);

CREATE TABLE IF NOT EXISTS messageTable (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT NOT NULL,
    sender_id INT NOT NULL,
    message TEXT NOT NULL,
    message_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES chatRoom(room_id),
    FOREIGN KEY (sender_id) REFERENCES userinfo(id)
);

-- Insert dummy data
INSERT INTO userinfo (email, password, name, username, bio) VALUES
('test1@test.com', '123456', 'User One', 'user1', 'Hello I am user 1'),
('test2@test.com', '123456', 'User Two', 'user2', 'Hello I am user 2');

