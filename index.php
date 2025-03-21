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
            <div class="row justify-content-evenly">
                <div class="col-5">
                    <div class="input-group mb-3">
                        <input type="search" class="form-control" placeholder="Cari Tamu Acara"
                            aria-label="Cari Tamu Acara" aria-describedby="button-addon2">
                        <button class="btn btn-outline-success" type="button" id="button-addon2">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <span class="p-1">Cari Tamu</span>
                        </button>
                    </div>
                    <div class="card mb-4">
                        <div class="row g-0 p-2 align-items-center">
                            <div class="col-md-4 text-center">
                                <img src="assets/tamu-img.jpg" class="img-fluid rounded-start" alt="image">
                                <button type="button" class="btn btn-success">
                                    <i class="fa-solid fa-user-check"></i>
                                    <span>Check In</span>
                                </button>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Nama Tamu</h5>
                                    <p class="card-text">
                                        <ul class="list-group">
                                            <li class="list-group-item">Malang</li>
                                            <li class="list-group-item">085812408380</li>
                                        </ul>
                                    </p>
                                    <p class="card-text">
                                        <i class="text-danger fw-bold">Belum Hadir</i>/
                                        <i class="text-success fw-bold">Sudah Hadir</i>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table">
                        <h5>Tamu yang telah Check In</h4>
                        <hr class="m-0">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nama Tamu</th>
                                <th scope="col">Asal</th>
                                <th scope="col">Telp/HP</th>
                                <th scope="col">Kehadiran</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Database connection
                            include 'inc/connection.php';

                            // Fetch data of guests who have already checked in
                            $sql = "SELECT id, nama_tamu, asal, no_telp FROM data_tamu WHERE kehadiran = 'Sudah Hadir'";
                            $result = $conn->query($sql);

                            if ($result->num_rows > 0) {
                                $no = 1;
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <th scope="row"><?php echo $no++; ?></th>
                                    <td><?php echo htmlspecialchars($row['nama_tamu']) ?></td>
                                    <td><?php echo htmlspecialchars($row['asal']) ?></td>
                                    <td><?php echo htmlspecialchars($row['no_telp']) ?></td>
                                    <td>
                                        <i class="text-success fw-bold">Sudah Hadir</i>
                                    </td>
                                </tr>
                            <?php
                                }
                            } else {
                                echo "<tr><td colspan='5' class='text-center'>Tidak ada tamu yang sudah hadir</td></tr>";
                            }

                            $conn->close();
                            ?>
                        </tbody>
                    </table>
                </div>
                <div class="col-5">
                </div>
            </div>
        </div>
        <div class="container">
            <?php
                // Database connection
                include 'inc/connection.php';

                // Pagination setup
                $limit = 5; // Number of records per page
                $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
                $start = ($page > 1) ? ($page * $limit) - $limit : 0;

                // Search functionality
                $search = isset($_GET['search']) ? $_GET['search'] : '';
                $searchQuery = $search ? "WHERE nama_tamu LIKE '%$search%' OR asal LIKE '%$search%' OR no_telp LIKE '%$search%'" : '';

                // Fetch data with pagination
                $sql = "SELECT SQL_CALC_FOUND_ROWS id, nama_tamu, asal, no_telp, kehadiran FROM data_tamu $searchQuery LIMIT $start, $limit";
                $result = $conn->query($sql);

                // Get total records
                $totalResult = $conn->query("SELECT FOUND_ROWS() as total");
                $totalRows = $totalResult->fetch_assoc()['total'];
                $totalPages = ceil($totalRows / $limit);
            ?>
            <div class="row">
                <div class="col-12">
                    <form method="GET" class="mb-3">
                        <div class="input-group">
                            <input type="search" name="search" class="form-control" placeholder="Cari Data Tamu"
                                value="<?php echo htmlspecialchars($search); ?>">
                            <button class="btn btn-outline-success" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <span>Cari</span>
                            </button>
                        </div>
                    </form>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama Tamu</th>
                                <th>Asal</th>
                                <th>Telp/HP</th>
                                <th>Kehadiran</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($result->num_rows > 0) {
                                $no = $start + 1;
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <td><?php echo $no++; ?></td>
                                    <td><?php echo htmlspecialchars($row['nama_tamu']); ?></td>
                                    <td><?php echo htmlspecialchars($row['asal']); ?></td>
                                    <td><?php echo htmlspecialchars($row['no_telp']); ?></td>
                                    <td>
                                        <i class="<?php echo $row['kehadiran'] == 'Sudah Hadir' ? 'text-success' : 'text-danger'; ?> fw-bold">
                                            <?php echo htmlspecialchars($row['kehadiran']); ?>
                                        </i>
                                    </td>
                                </tr>
                            <?php
                                }
                            } else {
                                echo "<tr><td colspan='5' class='text-center'>Tidak ada data tamu</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                    <nav>
                        <ul class="pagination justify-content-center">
                            <?php for ($i = 1; $i <= $totalPages; $i++) { ?>
                                <li class="page-item <?php echo $i == $page ? 'active' : ''; ?>">
                                    <a class="page-link" href="?page=<?php echo $i; ?>&search=<?php echo urlencode($search); ?>">
                                        <?php echo $i; ?>
                                    </a>
                                </li>
                            <?php } ?>
                        </ul>
                    </nav>
                </div>
            </div>
            <?php $conn->close(); ?>
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