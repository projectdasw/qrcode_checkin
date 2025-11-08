<?php
require_once '../inc/dompdf/vendor/autoload.php';
include '../inc/connection.php';

use Dompdf\Dompdf;
use Dompdf\Options;

$options = new Options();
$options->set('defaultFont', 'Arial');
$dompdf = new Dompdf($options);

$jenis = $_GET['jenis'] ?? 'all';
$value = $_GET['value'] ?? '';

$judul = 'Laporan Buku Tamu';
$where = '1=1';

switch ($jenis) {
    case 'hadir':
        $judul = 'Laporan Tamu Hadir';
        $where = "kehadiran = 'Hadir'";
        break;
    case 'tidak_hadir':
        $judul = 'Laporan Tamu Tidak Hadir';
        $where = "kehadiran = 'Belum Hadir'";
        break;
    case 'pemenang':
        $judul = 'Laporan Pemenang Undian';
        $where = "menang_undian = 'menang'";
        break;
    case 'vip':
        $judul = "Laporan Tamu - VIP";
        $where = "asal = 'VIP'";
        break;
    case 'sunandar':
        $judul = "Laporan Tamu - Sunandar";
        $where = "asal = 'Sunandar'";
        break;
    case 'pandanwangi':
        $judul = "Laporan Tamu - Pandanwangi";
        $where = "asal = 'Pandanwangi'";
        break;
    case 'surabaya_sidoarjo':
        $judul = "Laporan Tamu - Surabaya & Sidoarjo";
        $where = "asal LIKE '%Surabaya%' OR asal LIKE '%Sidoarjo%'";
        break;
    case 'jakarta':
        $judul = "Laporan Tamu - Jakarta";
        $where = "asal = 'Jakarta'";
        break;
    default:
        $judul = 'Laporan Seluruh Tamu';
}

$query = mysqli_query($conn, "SELECT * FROM data_tamu WHERE $where ORDER BY no_regist");

$html = "
    <h3 style='text-align: center;'>$judul</h3>
    <table width='100%' border='1' cellspacing='0' cellpadding='5'>
        <thead>
            <tr>
                <th>No</th>
                <th>No. Registrasi</th>
                <th>Nama</th>
                <th>Asal</th>
                <th>Status</th>
                <th>Kehadiran</th>
                <th>Jam Kedatangan</th>
                <th>Menang Hadiah</th>
            </tr>
        </thead>
        <tbody>";

$no = 1;
while ($row = mysqli_fetch_assoc($query)) {
    $html .= "<tr>
        <td>{$no}</td>
        <td>{$row['no_regist']}</td>
        <td>{$row['nama_tamu']}</td>
        <td>{$row['asal']}</td>
        <td>{$row['status']}</td>
        <td>{$row['kehadiran']}</td>
        <td>{$row['jam_kedatangan']}</td>
        <td>{$row['menang_hadiah']}</td>
    </tr>";
    $no++;
}

$html .= '</tbody></table>';

$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'landscape');
$dompdf->render();
$dompdf->stream(str_replace(' ', '_', $judul) . '.pdf', ["Attachment" => false]);
?>
