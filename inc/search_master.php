<?php
    require 'connection.php';

    $limit = 25;
    $page = isset($_POST['page']) ? (int)$_POST['page'] : 1;
    $start = ($page - 1) * $limit;
    $query = isset($_POST['query']) ? mysqli_real_escape_string($conn, $_POST['query']) : '';

    $condition = "";
    if (!empty($query)) {
        $condition = "WHERE 
            no_regist LIKE '%$query%' OR 
            nama_tamu LIKE '%$query%' OR
            asal LIKE '%$query%' OR
            status LIKE '%$query%'";
    }

    // Hitung total
    $sql_total = "SELECT COUNT(*) AS total FROM data_tamu $condition";
    $result_total = mysqli_query($conn, $sql_total);
    $total = mysqli_fetch_assoc($result_total)['total'];
    $pages = ceil($total / $limit);

    // Ambil data
    $sql = "SELECT * FROM data_tamu $condition LIMIT $start, $limit";
    $result = mysqli_query($conn, $sql);
    $no_urut = $start;
?>

<table class="table table-sm table-striped table-bordered table-responsive m-0">
    <thead>
        <tr>
            <th>#</th>
            <th>No. Regist</th>
            <th>Nama</th>
            <th>Asal</th>
            <th>Status</th>
            <th>Kehadiran</th>
            <th>Waktu Kehadiran</th>
            <th>Keterangan Tamu</th>
            <th>Keterangan Kehadiran</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?php if (mysqli_num_rows($result) > 0): ?>
            <?php while($row = mysqli_fetch_assoc($result)): ?>
                <tr>
                    <td><?= ++$no_urut ?></td>
                    <td><?= $row['no_regist'] ?></td>
                    <td><?= $row['nama_tamu'] ?></td>
                    <td><?= $row['asal'] ?></td>
                    <td>
                        <?php if($row['status'] == 'VIP'): ?>
                            <strong class="text-danger"><?= $row['status'] ?></strong>
                        <?php else: ?>
                            <strong class="text-success"><?= $row['status'] ?></strong>
                        <?php endif; ?>
                    </td>
                    <td>
                        <?php if($row['kehadiran'] == 'Belum Hadir'): ?>
                            <span>
                                <i class="fa-solid fa-circle-xmark text-danger"></i>
                                <strong class="text-danger fst-italic">
                                    <?= $row['kehadiran'] ?>
                                </strong>
                            </span>
                        <?php else: ?>
                            <span>
                                <i class="fa-solid fa-circle-check text-success"></i>
                                <strong class="text-success fst-italic">
                                    <?= $row['kehadiran'] ?>
                                </strong>
                            </span>
                        <?php endif; ?>
                    </td>
                    <td><?= $row['jam_kedatangan'] ?></td>
                    <td><?= $row['keterangan'] ?></td>
                    <td><?= $row['keterangan_hadir'] ?></td>
                    <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <?php if($row['kehadiran'] == 'Belum Hadir'): ?>
                                <button type="button" class="badge btn btn-sm btn-success btn-checkin" data-id="<?= $row['no_regist'] ?>" data-bs-toggle="modal"
                                    data-bs-target="#view_tamu">
                                    <i class="fa-solid fa-users-viewfinder"></i>
                                    <span>Check In</span>
                                </button>
                            <?php endif; ?>
                            <button class="badge btn btn-sm btn-warning btn-edit" data-id="<?= $row['no_regist'] ?>" data-bs-toggle="modal" data-bs-target="#edit_tamu">
                                <i class="fa fa-edit"></i> Edit
                            </button>
                            <button class="badge btn btn-sm btn-danger btn-delete" data-no="<?= $row['no_regist'] ?>">
                                <i class="fa fa-trash"></i> Hapus
                            </button>
                        </div>
                    </td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr><td colspan="10" class="text-center">Tidak ada data</td></tr>
        <?php endif; ?>
    </tbody>
</table>

<div class="d-flex flex-row justify-content-end mt-1">
    <?php
        $start_data = ($total > 0) ? ($start + 1) : 0;
        $end_data = min($start + $limit, $total);
    ?>
    <div id="info-pagination" class="small">
        Menampilkan <?= $start_data ?> – <?= $end_data ?> dari <?= $total ?> Tamu Undangan
    </div>
</div>

<?php if ($pages > 1): ?>
    <nav aria-label="page-navigation" class="mt-2">
        <ul class="pagination justify-content-end">
            <!-- Tombol Prev -->
            <li class="page-item <?= ($page <= 1) ? 'disabled' : '' ?>">
                <a class="page-link" href="#" data-page="<?= $page - 1 ?>">« Sebelumnya</a>
            </li>

            <!-- Nomor Halaman -->
            <?php for ($i = 1; $i <= $pages; $i++): ?>
                <li class="page-item <?= ($i == $page) ? 'active' : '' ?>">
                    <a class="page-link" href="#" data-page="<?= $i ?>"><?= $i ?></a>
                </li>
            <?php endfor; ?>

            <!-- Tombol Next -->
            <li class="page-item <?= ($page >= $pages) ? 'disabled' : '' ?>">
                <a class="page-link" href="#" data-page="<?= $page + 1 ?>">Selanjutnya »</a>
            </li>
        </ul>
    </nav>
<?php endif; ?>