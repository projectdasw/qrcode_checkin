<?php
    session_start();
    require_once "connection.php";

    $no_regist = $_POST['no_regist'];
    $jamdatang = $_POST['jam_kedatangan'];
    $keterangan = $_POST['keterangan'];
    $ket_hadir = $_POST['keterangan_hadir'];

    $update = mysqli_query($conn, "UPDATE data_tamu SET 
        kehadiran = 'Hadir',
        keterangan = '$keterangan',
        jam_kedatangan = '$jamdatang',
        keterangan_hadir = '$ket_hadir'
        WHERE no_regist = '$no_regist'
    ");

    if ($update) {
        $_SESSION['checkin_manual_success'] = true;
    } else {
        $_SESSION['checkin_manual_error'] = true;
    }

    header("Location: ../index.php");
    exit;

    session_unset();
?>
