<?php
session_start();
require_once "connection.php";

if (isset($_POST['id'])) {
    $id = $_POST['id'];
    $query = mysqli_query($conn, "SELECT * FROM data_tamu WHERE no_regist = '$id'");
    $data = mysqli_fetch_assoc($query);
    echo json_encode($data);
} else {
    echo json_encode(['error' => 'ID tidak diberikan']);
}
session_unset();
?>
