<?php
include 'connection.php';

$no_undian = $_POST['no_undian'];
$id_hadiah = $_POST['id_hadiah'];

// Validasi data hadiah
$h_query = mysqli_query($conn, "SELECT * FROM data_hadiah WHERE id_hadiah = '$id_hadiah'");
$hadiah = mysqli_fetch_assoc($h_query);

if (!$hadiah || $hadiah['jumlah_hadiah'] <= 0) {
    echo json_encode(['status' => 'error', 'msg' => 'Hadiah sudah habis atau tidak ditemukan.']);
    exit;
}

$nama_hadiah = $hadiah['nama_hadiah'];

// Tentukan status menang (menang biasa atau grand prize)
$jenisMenang = (strtolower($nama_hadiah) === 'Sepeda Listrik (Grand Prize)') ? 'grand prize' : 'menang';

// Update data tamu
mysqli_query($conn, "
    UPDATE data_tamu 
    SET menang_undian = '$jenisMenang', 
        menang_hadiah = '$nama_hadiah' 
    WHERE no_undian = '$no_undian'
");


// Update data hadiah
mysqli_query($conn, "
    UPDATE data_hadiah 
    SET jumlah_hadiah = jumlah_hadiah - 1,
        jumlah_menang = jumlah_menang + 1,
        sisa_hadiah = sisa_hadiah - 1
    WHERE id_hadiah = '$id_hadiah'
");

// Update setup pemenang jika ada
mysqli_query($conn, "
    UPDATE setup_pemenang 
    SET status = 'used' 
    WHERE no_undian = '$no_undian' AND id_hadiah = '$id_hadiah'
");

echo json_encode(['status' => 'success']);
?>