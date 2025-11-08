<?php
date_default_timezone_set('Asia/Jakarta');
include 'connection.php';

if (isset($_POST['no_regist'])) {
    $no_regist = $_POST['no_regist'];
    $keterangan_hadir = $_POST['keterangan_hadir'] ?? '';
    $waktu = date('H:i:s');

    // Cek apakah data tamu tersedia
    $cek = mysqli_query($conn, "SELECT * FROM data_tamu WHERE no_regist = '$no_regist'");
    if (mysqli_num_rows($cek) > 0) {
        // Update data tamu
        $query = "UPDATE data_tamu SET 
                    kehadiran = 'Hadir',
                    jam_kedatangan = '$waktu',
                    keterangan_hadir = '$keterangan_hadir'
                  WHERE no_regist = '$no_regist'";

        $update = mysqli_query($conn, $query);

        if ($update) {
            echo json_encode([
                'status' => 'success',
                'message' => 'Check-in berhasil'
            ]);
        } else {
            echo json_encode([
                'status' => 'error',
                'message' => 'Gagal update database: ' . mysqli_error($conn) // ✅ tambahkan ini
            ]);
        }
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Data tamu tidak ditemukan'
        ]);
    }
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Data tidak lengkap'
    ]);
}
?>
