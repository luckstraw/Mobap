CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

INSERT INTO users (email, password) VALUES ('test@example.com', '1234');