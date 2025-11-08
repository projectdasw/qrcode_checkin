<?php
include 'connection.php';

if (isset($_GET['q'])) {
    $no_regist = $_GET['q'];
    $result = mysqli_query($conn, "SELECT * FROM data_tamu WHERE no_regist = '$no_regist'");

    if (mysqli_num_rows($result) > 0) {
        $data = mysqli_fetch_assoc($result);
        echo json_encode([
            'status' => 'success',
            'tamu' => $data
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'QR Code tidak valid'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Parameter tidak ditemukan'
    ]);
}
?>
