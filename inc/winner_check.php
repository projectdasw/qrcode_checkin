<?php
require 'connection.php';

// Ambil peserta yang belum menang (kecuali Grand Prize)
$query = "SELECT no_undian, nama_tamu FROM data_tamu WHERE pemenang IS NULL ORDER BY RAND() LIMIT 1";
$result = $conn->query($query);

if ($row = $result->fetch_assoc()) {
    echo json_encode([
        'status' => 'success',
        'no_undian' => $row['no_undian'],
        'nama' => $row['nama_tamu']
    ]);
} else {
    echo json_encode([
        'status' => 'empty',
        'message' => 'Tidak ada data tersisa'
    ]);
}
