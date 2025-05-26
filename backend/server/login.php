<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->email) || !isset($data->password)) {
    echo json_encode(["status" => "error", "message" => "Email and password are required"]);
    exit;
}

$email = $conn->real_escape_string($data->email);
$password = $data->password;

$sql = "SELECT id, username, email, password FROM users WHERE email='$email'";
$result = $conn->query($sql);

if ($result === false) {
    echo json_encode(["status" => "error", "message" => "Database error"]);
    exit;
}

if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    
    if (password_verify($password, $row['password'])) {
        unset($row['password']);
        echo json_encode([
            "status" => "success",
            "message" => "Login successful",
            "user" => $row
        ]);
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Invalid password"
        ]);
    }
} else {
    echo json_encode([
        "status" => "error", 
        "message" => "Email not found"
    ]);
}
?>