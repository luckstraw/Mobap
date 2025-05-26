<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"));
$id = $data->id;
$sql = "DELETE FROM users WHERE id=$id";

if ($conn->query($sql)) {
    echo json_encode(["status" => "deleted"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>