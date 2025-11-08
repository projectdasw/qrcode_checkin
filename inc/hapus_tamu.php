<?php
session_start();
require_once 'connection.php';

$id = $_POST['no_regist'] ?? null;

if ($id) {
    // Ambil nama file QR Code berdasarkan ID
    $getQr = mysqli_query($conn, "SELECT qr_code FROM data_tamu WHERE no_regist = '$id'");
    $row = mysqli_fetch_assoc($getQr);
    
    if ($row && $row['qr_code']) {
        $qrFile = '../data-qr-tamu/' . $row['qr_code'];

        // Hapus file QR Code jika ada
        if (file_exists($qrFile)) {
            unlink($qrFile);
        }
    }

    // Hapus data tamu dari database
    $delete = mysqli_query($conn, "DELETE FROM data_tamu WHERE no_regist = '$id'");

    if ($delete) {
        $_SESSION['flash_message'] = 'Data tamu berhasil dihapus';
    } else {
        $_SESSION['flash_message'] = 'Gagal menghapus data tamu';
    }
} else {
    $_SESSION['flash_message'] = 'ID tidak ditemukan';
}

header("Location: ../index.php");
exit;
session_unset();
?>