<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

// $host = "sql311.epizy.com"; // Replace with your host
// $db = "epiz_12345678_flutterdb"; // Replace with your DB name
// $user = "epiz_12345678"; // Replace with your username
// $pass = "your_password"; // Replace with your password
// $conn = new mysqli($host, $user, $pass, $db);

// if ($conn->connect_error) {
//     echo json_encode(["success" => false, "message" => "Connection failed"]);
//     exit();
// }

include 'db.php';

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$sql = "SELECT * FROM users WHERE email='$email' AND password='$password'";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    echo json_encode(["success" => true, "message" => "Login successful"]);
} else {
    echo json_encode(["success" => false, "message" => "Invalid credentials"]);
}

$conn->close();
?>