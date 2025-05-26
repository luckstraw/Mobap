<?php
include 'db.php';

$sql = "SELECT id, username, email FROM users ORDER BY id DESC";
$result = $conn->query($sql);

if ($result === false) {
    echo json_encode([]);
    exit;
}

$users = [];
while($row = $result->fetch_assoc()) {
    $users[] = $row;
}

echo json_encode($users);
?>