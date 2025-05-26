<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->username) || !isset($data->email) || !isset($data->password)) {
    echo json_encode(["status" => "error", "message" => "Username, email and password are required"]);
    exit;
}

$username = $conn->real_escape_string($data->username);
$email = $conn->real_escape_string($data->email);
$password = password_hash($data->password, PASSWORD_DEFAULT);

// Check if email already exists
$check_sql = "SELECT * FROM users WHERE email = '$email'";
$result = $conn->query($check_sql);
if ($result->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Email already exists"]);
    exit;
}

$sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$password')";

if ($conn->query($sql)) {
    echo json_encode([
        "status" => "success",
        "message" => "Registration successful"
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Registration failed"
    ]);
}
?>