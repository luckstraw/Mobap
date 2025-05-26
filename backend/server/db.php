<?php
$host = "sql309.infinityfree.com";
$user = "if0_39066193";
$pass = "ENC8Jf5ZTRK";
$dbname = "if0_39066193_mobap_db_lab5";

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>