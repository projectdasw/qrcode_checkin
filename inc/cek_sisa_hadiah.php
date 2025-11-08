<?php
include 'connection.php';

$id_hadiah = $_GET['id_hadiah'] ?? null;

// Ambil nama hadiah grandprize (boleh kamu hardcode ID-nya misalnya 99, atau nama hadiah)
$grandprize = mysqli_query($conn, "SELECT nama_hadiah FROM data_hadiah WHERE id_hadiah = '$id_hadiah'");
$data = mysqli_fetch_assoc($grandprize);
$nama_grandprize = $data['nama_hadiah'] ?? '';

if (strtolower($nama_grandprize) === 'sepeda listrik') {
    // Cek apakah masih ada hadiah lain selain grandprize yang jumlah > 0
    $cek = mysqli_query($conn, "
        SELECT COUNT(*) AS sisa 
        FROM data_hadiah 
        WHERE LOWER(nama_hadiah) != 'sepeda listrik' 
        AND jumlah_hadiah > 0
    ");
    $cekData = mysqli_fetch_assoc($cek);
    if ($cekData['sisa'] > 0) {
        echo json_encode(['boleh' => false]);
        exit;
    }
}

echo json_encode(['boleh' => true]);
?>