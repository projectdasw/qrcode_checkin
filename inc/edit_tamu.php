<?php
    session_start();
    require_once "connection.php";

    $no_regist = $_POST['no_regist'];
    $nama_tamu = $_POST['nama_tamu'];
    $asal = $_POST['asal'];
    $status = $_POST['status'];
    $keterangan = $_POST['keterangan'];
    $keterangan_hadir = $_POST['keterangan_hadir'];

    $update = mysqli_query($conn, "UPDATE data_tamu SET 
        nama_tamu = '$nama_tamu',
        asal = '$asal',
        status = '$status',
        keterangan = '$keterangan',
        keterangan_hadir = '$keterangan_hadir'
        WHERE no_regist = '$no_regist'
    ");

    if ($update) {
        $_SESSION['edit_success'] = true;
    } else {
        $_SESSION['edit_error'] = true;
    }

    header("Location: ../index.php");
    exit;

    session_unset();
?>
