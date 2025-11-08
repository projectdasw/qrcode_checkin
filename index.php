<?php
    date_default_timezone_set('Asia/Jakarta');
    session_start();
    require_once "inc/connection.php";
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">
        <title>Check In - QR Code</title>
        <!-- CSS CORE -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <script src="assets/js/sweetalert2.js"></script>
    </head>
    <body>
        <div class="container-fluid px-0">
            <?php if (isset($_SESSION['flash_message'])): ?>
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'Berhasil',
                        text: '<?= $_SESSION['flash_message'] ?>',
                        showConfirmButton: false,
                        timer: 1500
                    });
                </script>
                <?php unset($_SESSION['flash_message']); ?>
            <?php endif; ?>

            <?php if (isset($_SESSION['edit_success'])): ?>
                <script>
                Swal.fire({
                    icon: "success",
                    title: "Berhasil",
                    text: "Data tamu berhasil diperbarui",
                    timer: 1500,
                    showConfirmButton: false
                });
                </script>
            <?php unset($_SESSION['edit_success']); endif; ?>

            <?php if (isset($_SESSION['edit_error'])): ?>
                <script>
                Swal.fire({
                    icon: "error",
                    title: "Gagal",
                    text: "Gagal memperbarui data tamu",
                });
                </script>
            <?php unset($_SESSION['edit_error']); endif; ?>

            <?php if (isset($_SESSION['checkin_manual_success'])): ?>
                <script>
                Swal.fire({
                    icon: "success",
                    title: "Berhasil",
                    text: "Tamu berhasil Check In",
                    timer: 1500,
                    showConfirmButton: false
                });
                </script>
            <?php unset($_SESSION['checkin_manual_success']); endif; ?>

            <?php if (isset($_SESSION['checkin_manual_error'])): ?>
                <script>
                Swal.fire({
                    icon: "error",
                    title: "Gagal",
                    text: "Tamu gagal Check In. Silakan coba lagi.",
                });
                </script>
            <?php unset($_SESSION['checkin_manual_error']); endif; ?>

            <!-- Modal Tambah Tamu -->
            <div class="modal fade" id="tambah_tamu" tabindex="-1" aria-labelledby="tambah_tamuLabel" aria-hidden="true">
                <?php
                    // Generate nomor registrasi otomatis
                    do {
                        $new_no_regist = "REG-" . rand(100000, 999999);
                        $check_regist = mysqli_query($conn, "SELECT no_regist FROM data_tamu WHERE no_regist = '$new_no_regist'");
                    } while (mysqli_num_rows($check_regist) > 0);

                    // Generate nomor undian otomatis
                    do {
                        $new_no_undian = rand(100000, 999999);
                        $check_undian = mysqli_query($conn, "SELECT no_undian FROM data_tamu WHERE no_undian = '$new_no_undian'");
                    } while (mysqli_num_rows($check_undian) > 0);
                ?>
                <div class="modal-dialog modal-dialog-scrollable">
                    <form class="modal-content needs-validation" action="inc/tambah_tamu.php" method="POST" autocomplete="off" novalidate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="tambah_tamuLabel">Tambah Tamu Undangan</h1>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="no_regist" class="form-label">No. Registrasi</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_regist" name="no_regist" value="<?= $new_no_regist ?>" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="no_undian" class="form-label">No. Undian Doorprize</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_undian" name="no_undian" value="<?= $new_no_undian ?>" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="nama_tamu" class="form-label">Nama</label>
                                <input type="text" class="form-control" id="nama_tamu" name="nama_tamu" required>
                                <div class="invalid-feedback">
                                    Nama Tamu tidak boleh kosong
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="asal" class="form-label">Asal</label>
                                <input type="text" class="form-control" id="asal" name="asal">
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" aria-label="status" required>
                                    <option selected disabled value="">Pilih Status Tamu</option>
                                    <option value="Umum">Umum</option>
                                    <option value="VIP">VIP</option>
                                </select>
                                <div class="invalid-feedback">
                                    Pilih status tamu
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="kehadiran" class="form-label">Kehadiran</label>
                                <input type="text" class="form-control bg-body-secondary" id="kehadiran"
                                name="kehadiran" value="Belum Hadir" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="keterangan" class="form-label">Keterangan</label>
                                <input type="text" class="form-control" id="keterangan" name="keterangan">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">
                                <i class="fa-solid fa-circle-plus"></i>
                                <span>Tambah Tamu</span>
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                                <i class="fa-solid fa-circle-xmark"></i>
                                <span>Batal</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Modal Tampil Data + Check In Manual -->
            <div class="modal fade" id="view_tamu" tabindex="-1" aria-labelledby="view_tamuLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <form class="modal-content needs-validation" action="inc/checkin_tamu_manual.php" method="POST" id="form-view-tamu" novalidate>
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="view_tamuLabel">Detail Tamu - Check In Manual</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="no_regist" class="form-label">No. Registrasi</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_regist" name="no_regist" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="no_undian" class="form-label">No. Undian Doorprize</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_undian" name="no_undian" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="nama_tamu" class="form-label">Nama</label>
                                <input type="text" class="form-control bg-body-secondary" id="nama_tamu" name="nama_tamu" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="asal" class="form-label">Asal</label>
                                <input type="text" class="form-control bg-body-secondary" id="asal" name="asal" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <input type="text" class="form-control bg-body-secondary" id="status" name="status" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="kehadiran" class="form-label">Kehadiran</label>
                                <input type="text" class="form-control bg-body-secondary" id="kehadiran" name="kehadiran" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="jam_kedatangan" class="form-label">Jam Kedatangan</label>
                                <input type="text" class="form-control bg-body-secondary" id="jam_kedatangan" name="jam_kedatangan"
                                    value="<?php echo date('H:i:s'); ?>" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="keterangan" class="form-label">Keterangan Tamu</label>
                                <input type="text" class="form-control" id="keterangan" name="keterangan">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Keterangan Kehadiran</label>
                                <select class="form-select" id="keterangan_hadir" name="keterangan_hadir" required>
                                    <option value="" selected disabled>-- Datang bersama --</option>
                                    <option value="datang Seorang Diri">Seorang Diri</option>
                                    <option value="datang bersama Istri">Istri</option>
                                    <option value="datang bersama Suami">Suami</option>
                                    <option value="datang bersama Anak">Anak</option>
                                    <option value="datang bersama Rekan">Rekan</option>
                                    <option value="datang bersama Keluarga">Keluarga</option>
                                </select>
                                <div class="invalid-feedback">
                                    Silakan pilih keterangan kehadiran.
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">
                                <i class="fa-solid fa-user-check"></i>
                                <span>Check In</span>
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                                <i class="fa-solid fa-user-xmark"></i>
                                <span>Batal</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Modal Edit Tamu -->
            <div class="modal fade" id="edit_tamu" tabindex="-1" aria-labelledby="edit_tamuLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable">
                    <form class="modal-content" action="inc/edit_tamu.php" method="POST" id="form-edit-tamu">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="edit_tamuLabel">Edit Tamu</h1>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="no_regist" class="form-label">No. Registrasi</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_regist" name="no_regist" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="no_undian" class="form-label">No. Undian Doorprize</label>
                                <input type="text" class="form-control bg-body-secondary" id="no_undian" name="no_undian" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="nama_tamu" class="form-label">Nama</label>
                                <input type="text" class="form-control" id="nama_tamu" name="nama_tamu">
                            </div>
                            <div class="mb-3">
                                <label for="asal" class="form-label">Asal</label>
                                <input type="text" class="form-control" id="asal" name="asal">
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status">
                                    <option value="Umum">Umum</option>
                                    <option value="VIP">VIP</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="kehadiran" class="form-label">Kehadiran</label>
                                <input type="text" class="form-control bg-body-secondary" id="kehadiran" name="kehadiran" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="keterangan" class="form-label">Keterangan</label>
                                <input type="text" class="form-control" id="keterangan" name="keterangan">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Keterangan Kehadiran</label>
                                <select class="form-select" id="keterangan_hadir" name="keterangan_hadir">
                                    <option selected disabled>-- Datang bersama --</option>
                                    <option value="datang Seorang Diri">Seorang Diri</option>
                                    <option value="datang bersama Istri">Istri</option>
                                    <option value="datang bersama Suami">Suami</option>
                                    <option value="datang bersama Anak">Anak</option>
                                    <option value="datang bersama Rekan">Rekan</option>
                                    <option value="datang bersama Keluarga">Keluarga</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">
                                <i class="fa-solid fa-circle-check"></i>
                                <span>Simpan Perubahan</span>
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                                <i class="fa-solid fa-circle-xmark"></i>
                                <span>Batal</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Modal Tambah User -->
            <div class="modal fade" id="tambah_user" tabindex="-1" aria-labelledby="tambah_userLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="tambah_userLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                        ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Print Laporan -->
            <div class="modal fade" id="print_btn" tabindex="-1" aria-labelledby="print_btnLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="print_btnLabel">Laporan Buku Tamu Undangan</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <strong class="fs-4">Keseluruhan Buku Tamu Undangan & Undian Doorprize</strong>
                                <p class="fst-italic m-0">
                                    Anda dapat mencetak laporan buku tamu undangan dengan memilih tombol di bawah ini.
                                </p>
                                <hr />
                                <table class="table">
                                    <thead>
                                        <th>Nama Laporan</th>
                                        <th>Export PDF/Excel</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Buku Tamu Undangan (ALL)</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=all">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=all">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu yang Hadir</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=hadir">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=hadir">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu yang tidak Hadir</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=tidak_hadir">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=tidak_hadir">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>List Pemenang Undian Doorprize & Grand Prize</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=pemenang">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=pemenang">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu Undangan - VIP</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=vip">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=vip">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu Undangan - Sunandar</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=sunandar">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=sunandar">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu Undangan - Pandanwangi</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=pandanwangi">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=pandanwangi">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu Undangan - Surabaya & Sidoarjo</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=surabaya_sidoarjo">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=surabaya_sidoarjo">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Data Tamu Undangan - Jakarta</td>
                                            <td>
                                                <a class="btn btn-danger btn-sm" href="export/export_pdf.php?jenis=jakarta">
                                                    <i class="fa-solid fa-file-pdf"></i>
                                                    <span>PDF</span>
                                                </a>
                                                <a class="btn btn-success btn-sm" href="export/export_excel.php?jenis=jakarta">
                                                    <i class="fa-solid fa-file-excel"></i>
                                                    <span>Excel</span>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header d-flex flex-row justify-content-between align-items-center">
                    <div class="h4 m-0">
                        <i class="fa-solid fa-qrcode"></i>
                        <span>Scan QR Code - Check In</span>
                    </div>
                    <div class="m-0">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" id="btn-tambah-tamu"
                            data-bs-toggle="modal" data-bs-target="#tambah_tamu">
                            <i class="fa-solid fa-plus"></i>
                            <span>Tambah Data Tamu</span>
                        </button>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row row-cols-1 row-cols-md-4 g-4 mt-0">
                        <div class="col m-0">
                            <div class="card">
                                <img src="assets/card-overlay.webp" class="card-img" alt="image">
                                <div class="card-img-overlay">
                                    <h5 class="card-title">Total Tamu Undangan</h5>
                                    <p class="card-text">
                                        <?php
                                            $sql = "SELECT COUNT(*) AS total FROM data_tamu";
                                            $result = mysqli_query($conn, $sql);
                                            $row = mysqli_fetch_assoc($result);
                                        ?>
                                        <h1><?= $row['total'] ?></h1>
                                        <span class="fw-semibold fst-italic" style="font-size: 0.8rem;">
                                            Tamu Undangan Umum & VIP
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col m-0">
                            <div class="card">
                                <img src="assets/card-overlay.webp" class="card-img" alt="image">
                                <div class="card-img-overlay">
                                    <h5 class="card-title">Tamu Hadir</h5>
                                    <p class="card-text">
                                        <?php
                                            $sql = "SELECT COUNT(*) AS total FROM data_tamu where kehadiran = 'Hadir'";
                                            $result = mysqli_query($conn, $sql);
                                            $row = mysqli_fetch_assoc($result);
                                        ?>
                                        <h1><?= $row['total'] ?></h1>
                                        <span class="fw-semibold fst-italic" style="font-size: 0.8rem;">
                                            Tamu Undangan yang telah hadir
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col m-0">
                            <div class="card">
                                <img src="assets/card-overlay.webp" class="card-img" alt="image">
                                <div class="card-img-overlay">
                                    <h5 class="card-title">Tamu Tidak Hadir</h5>
                                    <p class="card-text">
                                        <?php
                                            $sql = "SELECT COUNT(*) AS total FROM data_tamu where kehadiran = 'Belum Hadir'";
                                            $result = mysqli_query($conn, $sql);
                                            $row = mysqli_fetch_assoc($result);
                                        ?>
                                        <h1><?= $row['total'] ?></h1>
                                        <span class="fw-semibold fst-italic" style="font-size: 0.8rem;">
                                            Tamu Undangan yang tidak hadir
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-3">
                        <div class="card-header h4 d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <i class="fa-solid fa-clipboard-list"></i>
                                <span class="ms-2">Data Tamu Undangan</span>
                            </div>
                            <div class="d-flex justify-content-between float-end w-50">
                                <input class="form-control w-75" type="text" id="search" placeholder="Cari Data Tamu"
                                    autocomplete="off">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#print_btn">
                                    <i class="fa-solid fa-print"></i>
                                    <span>Print Laporan</span>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="tabel-tamu">
                                <!-- Data dari search_master.php akan dimuat di sini -->
                            </div>
                        </div>
                        <div class="card-footer">
                            <span class="text-body-secondary float-end">Data Master Tamu Undangan</span>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <small class="float-end">Developed by DASW Project</small>
                </div>
            </div>
        </div>
        <!-- JS CORE -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/fontawesome/js/all.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
<?php session_unset(); ?>