<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Check In - QR Code</title>
        <!-- CSS CORE -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ee5974d453.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container p-3">
            <?php
                // Database connection
                include 'inc/connection.php';

                // Pagination setup
                $limit = 5;
                $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
                $start = ($page > 1) ? ($page * $limit) - $limit : 0;

                // Search functionality
                $search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';
                $whereClause = $search ? "WHERE nama_tamu LIKE '%$search%'" : '';

                // Fetch data
                $sql = "SELECT * FROM data_tamu $whereClause LIMIT $start, $limit";
                $result = $conn->query($sql);

                // Count total rows for pagination
                $totalResult = $conn->query("SELECT COUNT(*) AS total FROM data_tamu $whereClause");
                $totalRows = $totalResult->fetch_assoc()['total'];
                $totalPages = ceil($totalRows / $limit);
            ?>

            <div class="card">
                <div class="card-header">
                    <h3 class="m-0">Check In Kehadiran Tamu</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-4">
                            <div class="card mb-3">
                                <div class="row align-items-center g-0">
                                    <div class="col-md-4">
                                        <img src="assets/tamu-img.jpg" class="img-fluid rounded-start" alt="image">
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <h5 class="card-title">Nama Tamu</h5>
                                            <p class="card-text">
                                                <ul class="list-group">
                                                    <li class="list-group-item">Malang</li>
                                                    <li class="list-group-item">123456789</li>
                                                </ul>
                                            </p>
                                            <button type="button" class="btn btn-outline-success">
                                                <i class="fa-solid fa-user-check"></i>
                                                <span>Check In</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-8">
                            <form method="GET" class="d-flex" autocomplete="off">
                                <input type="search" name="search" class="form-control me-2" placeholder="Cari Tamu" value="<?= htmlspecialchars($search) ?>">
                                <a href="index.php" class="btn btn-primary w-25 ms-2">
                                    <i class="fa-solid fa-list me-1"></i>
                                    <span>Data Master</span>
                                </a>
                            </form>
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nama</th>
                                        <th>Asal</th>
                                        <th>Telp/Hp</th>
                                        <th>Kehadiran</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if ($result->num_rows > 0): ?>
                                        <?php $no = $start + 1; ?>
                                        <?php while ($row = $result->fetch_assoc()): ?>
                                            <tr>
                                                <td><?= $no++ ?></td>
                                                <td><?= htmlspecialchars($row['nama_tamu']) ?></td>
                                                <td><?= htmlspecialchars($row['asal']) ?></td>
                                                <td><?= htmlspecialchars($row['no_telp']) ?></td>
                                                <td>
                                                    <?php
                                                        if(htmlspecialchars($row['kehadiran']) == 'Sudah Hadir'){
                                                    ?>
                                                        <span class="text-success fw-bold">
                                                            <?= htmlspecialchars($row['kehadiran']) ?>
                                                        </span>
                                                    <?php
                                                        } else {
                                                    ?>
                                                        <span class="text-danger fw-bold">
                                                            <?= htmlspecialchars($row['kehadiran']) ?>
                                                        </span>
                                                    <?php
                                                        }
                                                    ?>
                                                </td>
                                            </tr>
                                        <?php endwhile; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="5" class="text-center">Tidak ada data</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                            <div class="d-flex justify-content-between align-items-center">
                                <p class="card-text fs-5 m-0">
                                    Total Data Tamu Undangan: <?= $totalRows ?>
                                </p>
                                <ul class="pagination align-items-center m-0">
                                    <span class="me-3">Paginasi</span>
                                    <?php for ($i = 1; $i <= $totalPages; $i++): ?>
                                        <li class="page-item <?= ($i == $page) ? 'active' : '' ?>">
                                            <a class="page-link" href="?page=<?= $i ?>&search=<?= urlencode($search) ?>"><?= $i ?></a>
                                        </li>
                                    <?php endfor; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- JS CORE -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    </body>
</html>