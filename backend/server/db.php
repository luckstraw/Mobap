<?php
header('Content-Type: application/json');
error_reporting(0);

$servername = "sql309.infinityfree.com";
$username = "if0_39066193";  // Your database username
$password = "E---------K";      // Your database password
$dbname = "if0_39066193_mobap_db_lab6";   // Your database name

$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8mb4");

// Enable strict mode
$conn->query("SET sql_mode = 'STRICT_ALL_TABLES'");

if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "Connection failed"
    ]));
}

// Create users table if it doesn't exist
$sql = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)";

if (!$conn->query($sql)) {
    die(json_encode([
        "status" => "error",
        "message" => "Table creation failed: " . $conn->error
    ]));
}
?>