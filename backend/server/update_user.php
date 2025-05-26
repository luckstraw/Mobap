<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));
$id = $data->id;
$username = $data->username;
$email = $data->email;
$sql = "UPDATE users SET username='$username', email='$email' WHERE id=$id";

if ($conn->query($sql)) {
    echo json_encode(["status" => "updated"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>