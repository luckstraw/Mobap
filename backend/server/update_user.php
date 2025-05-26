<?php
include 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$id = (int)$data['id'];  // Cast to integer
$username = $data['username'];

if (!$id || !$username) {
    echo json_encode(['status' => 'error', 'message' => 'Missing required fields']);
    exit;
}

$stmt = $conn->prepare("UPDATE users SET username = ? WHERE id = ?");
$stmt->bind_param("si", $username, $id);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success', 'message' => 'User updated successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Failed to update user']);
}

$stmt->close();
$conn->close();
?>