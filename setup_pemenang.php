<?php
require_once 'inc/connection.php';

// Proses form jika disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $no_undian = $_POST['no_undian'];
    $id_hadiah = $_POST['id_hadiah'];

    // Cek apakah data sudah ada
    $cek = mysqli_query($conn, "SELECT * FROM setup_pemenang WHERE no_undian = '$no_undian' AND id_hadiah = '$id_hadiah'");
    if (mysqli_num_rows($cek) > 0) {
        $msg = "<div class='alert alert-warning'>Data sudah ada!</div>";
    } else {
        $insert = mysqli_query($conn, "INSERT INTO setup_pemenang (no_undian, id_hadiah) VALUES ('$no_undian', '$id_hadiah')");
        $msg = $insert ? "<div class='alert alert-success'>Setup berhasil!</div>" : "<div class='alert alert-danger'>Gagal menambahkan!</div>";
    }
}

// Ambil data hadiah
$hadiah = mysqli_query($conn, "SELECT * FROM data_hadiah ORDER BY id_hadiah");

// Ambil data tamu yang belum menang
$tamu = mysqli_query($conn, "SELECT no_undian, nama_tamu FROM data_tamu WHERE menang_undian IS NULL OR menang_undian = '' ORDER BY nama_tamu");
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Setup Pemenang Undian Hadiah</title>
        <!-- CSS CORE -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <script src="assets/js/sweetalert2.js"></script>
    </head>
    <body>
         <h2>Setup Pemenang Undian Otomatis</h2>
    <?php if (!empty($msg)) echo $msg; ?>

    <form method="POST" class="row g-3 mt-2">
        <div class="col-md-6">
            <label for="no_undian" class="form-label">Pilih Peserta</label>
            <select name="no_undian" id="no_undian" class="form-select" required>
                <option value="">-- Pilih Peserta --</option>
                <?php while ($row = mysqli_fetch_assoc($tamu)): ?>
                    <option value="<?= $row['no_undian'] ?>"><?= $row['no_undian'] ?> - <?= $row['nama_tamu'] ?></option>
                <?php endwhile; ?>
            </select>
        </div>

        <div class="col-md-6">
            <label for="id_hadiah" class="form-label">Pilih Hadiah</label>
            <select name="id_hadiah" id="id_hadiah" class="form-select" required>
                <option value="">-- Pilih Hadiah --</option>
                <?php while ($row = mysqli_fetch_assoc($hadiah)): ?>
                    <option value="<?= $row['id_hadiah'] ?>"><?= $row['nama_hadiah'] ?> (tersisa <?= $row['jumlah_hadiah'] ?>)</option>
                <?php endwhile; ?>
            </select>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Tambahkan Setup</button>
        </div>
    </form>

    <hr>

    <h4>Daftar Setup Pemenang</h4>
    <table class="table table-bordered mt-2">
        <thead class="table-light">
            <tr>
                <th>No</th>
                <th>No Undian</th>
                <th>Nama Tamu</th>
                <th>Hadiah</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $list = mysqli_query($conn, "
                SELECT sp.*, dt.nama_tamu, dh.nama_hadiah
                FROM setup_pemenang sp
                JOIN data_tamu dt ON dt.no_undian = sp.no_undian
                JOIN data_hadiah dh ON dh.id_hadiah = sp.id_hadiah
                ORDER BY sp.id DESC
            ");
            $no = 1;
            while ($row = mysqli_fetch_assoc($list)) {
                echo "<tr>
                    <td>{$no}</td>
                    <td>{$row['no_undian']}</td>
                    <td>{$row['nama_tamu']}</td>
                    <td>{$row['nama_hadiah']}</td>
                    <td><span class='badge bg-" . ($row['status'] == 'used' ? 'success' : 'warning') . "'>{$row['status']}</span></td>
                </tr>";
                $no++;
            }
            ?>
        </tbody>
    </table>
        <!-- JS CORE -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/fontawesome/js/all.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>