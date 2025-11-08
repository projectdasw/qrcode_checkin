<?php
// Template dasar untuk export laporan ke Excel

include '../inc/connection.php';

function export_excel($judul, $query_sql, $filename) {
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=$filename");

    echo "No\tNama Tamu\tAsal\tStatus\tKehadiran\tMenang Hadiah\n";

    global $conn;
    $query = mysqli_query($conn, $query_sql);
    $no = 1;
    while ($row = mysqli_fetch_assoc($query)) {
        echo "{$no}\t{$row['nama_tamu']}\t{$row['asal']}\t{$row['status']}\t{$row['kehadiran']}\t{$row['menang_hadiah']}\n";
        $no++;
    }
}

// Panggil berdasarkan jenis
$jenis = $_GET['jenis'] ?? 'all';
switch ($jenis) {
    case 'hadir':
        export_excel('Tamu Hadir', "SELECT * FROM data_tamu WHERE kehadiran = 'Hadir'", 'tamu_hadir.xls');
        break;
    case 'tidak_hadir':
        export_excel('Tamu Tidak Hadir', "SELECT * FROM data_tamu WHERE kehadiran IS NULL OR kehadiran != 'Hadir'", 'tamu_tidak_hadir.xls');
        break;
    case 'pemenang':
        export_excel('Pemenang Undian', "SELECT * FROM data_tamu WHERE menang_undian = 'menang'", 'pemenang_undian.xls');
        break;
    case 'vip':
        export_excel('Tamu VIP', "SELECT * FROM data_tamu WHERE asal = 'VIP'", 'tamu_vip.xls');
        break;
    case 'sunandar':
        export_excel('Tamu Sunandar', "SELECT * FROM data_tamu WHERE asal = 'Sunandar'", 'tamu_sunandar.xls');
        break;
    case 'pandanwangi':
        export_excel('Tamu Pandanwangi', "SELECT * FROM data_tamu WHERE asal = 'Pandanwangi'", 'tamu_pandanwangi.xls');
        break;
    case 'surabaya_sidoarjo':
        export_excel('Tamu Surabaya & Sidoarjo', "SELECT * FROM data_tamu WHERE asal LIKE '%Surabaya%' OR asal LIKE '%Sidoarjo%'", 'tamu_surabaya_sidoarjo.xls');
        break;
    case 'jakarta':
        export_excel('Tamu Jakarta', "SELECT * FROM data_tamu WHERE asal = 'Jakarta'", 'tamu_jakarta.xls');
        break;
    default:
        export_excel('Buku Tamu All', "SELECT * FROM data_tamu", 'buku_tamu_all.xls');
        break;
}
?>
