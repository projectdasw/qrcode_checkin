<?php
// Database connection settings
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'checkin_db_trial';

// Create connection
$conn = new mysqli($host, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>