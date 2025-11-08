<?php
include 'connection.php';

$no_undian = $_GET['no_undian'];
$id_hadiah = $_GET['id_hadiah'];

// Ambil nama tamu
$q = mysqli_query($conn, "SELECT nama_tamu FROM data_tamu WHERE no_undian = '$no_undian'");
$data = mysqli_fetch_assoc($q);
$nama = $data['nama_tamu'] ?? 'Tidak diketahui';

// Ambil nama hadiah
$h_query = mysqli_query($conn, "SELECT nama_hadiah FROM data_hadiah WHERE id_hadiah = '$id_hadiah'");
$hadiah = mysqli_fetch_assoc($h_query);
$nama_hadiah = $hadiah['nama_hadiah'] ?? '-';

echo "
    <h4 class='m-0'>No. Undian</h4>
    <h1 style='font-size: 60px;'>$no_undian</h1>
    <h1 class='fs-4'><strong>$nama</strong></h1>
    <p class='fs-5'>Menang undian hadiah: <strong class='text-success'>$nama_hadiah</strong> 🎁</p>
    <div class='d-flex justify-content-center gap-3 mt-3'>
        <button class='btn btn-success btn-lg' onclick=\"simpanPemenang('$no_undian', '$id_hadiah')\">
            <i class='fas fa-check'></i> Simpan Pemenang
        </button>
        <button class='btn btn-danger btn-lg' onclick='skipPemenang()'>
            <i class='fas fa-forward'></i> Skip
        </button>
    </div>
";
?>
