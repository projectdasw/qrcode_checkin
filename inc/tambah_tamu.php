<?php
    session_start();
    require_once 'connection.php';
    require_once '../inc/phpqrcode/qrlib.php';

    $no_regist = $_POST['no_regist'];
    $no_undian = $_POST['no_undian'];
    $nama_tamu = $_POST['nama_tamu'];
    $asal = $_POST['asal'];
    $status = $_POST['status'];
    $kehadiran = $_POST['kehadiran'];
    $keterangan = $_POST['keterangan'];

    // Generate QR Code
    $qr_data = $no_regist;
    $qr_name = $nama_tamu;
    $qr_filename = uniqid($qr_data) . '_' . $qr_name . '.png';
    $qr_filepath = '../data-qr-tamu/' . $qr_filename;
    QRcode::png($qr_data, $qr_filepath, QR_ECLEVEL_L, 12, 2);


    $sql = "INSERT INTO data_tamu (no_regist, no_undian, nama_tamu, asal, status, kehadiran, keterangan, qr_code) 
            VALUES ('$no_regist', '$no_undian', '$nama_tamu', '$asal', '$status', '$kehadiran', '$keterangan', '$qr_filename')";

    if (mysqli_query($conn, $sql)) {
        $_SESSION['flash_message'] = 'Data Tamu telah ditambah';
    } else {
        $_SESSION['flash_message'] = 'Gagal menambahkan data';
    }

    header("Location: ../index.php");
    exit;
    session_unset();
?>
