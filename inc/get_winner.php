<?php
    include 'connection.php';

    // Jumlah data per halaman
    $limit = 8;
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    if ($page < 1) $page = 1;
    $offset = ($page - 1) * $limit;

    // Hitung total data & halaman
    $totalQuery = mysqli_query($conn, "SELECT COUNT(*) as total FROM data_tamu WHERE menang_undian = 'menang'");
    $totalData = mysqli_fetch_assoc($totalQuery);
    $total = $totalData['total'];
    $totalPages = ceil($total / $limit);

    // Ambil data pemenang
    $query = mysqli_query($conn, "
        SELECT no_undian, nama_tamu, menang_hadiah 
        FROM data_tamu 
        WHERE menang_undian = 'menang' 
        ORDER BY no_regist DESC 
        LIMIT $limit OFFSET $offset
    ");

    $no = $offset + 1;

    while ($row = mysqli_fetch_assoc($query)) {
        echo "<tr>
                <td>{$no}</td>
                <td>{$row['no_undian']}</td>
                <td>{$row['nama_tamu']}</td>
                <td>{$row['menang_hadiah']}</td>
            </tr>";
        $no++;
    }

    // Tampilkan pagination Bootstrap
    echo '<tr><td colspan="4">';
    echo '<nav><ul class="pagination justify-content-center mt-3">';

    // Tombol "Previous"
    $prevPage = $page - 1;
    $prevDisabled = $page <= 1 ? 'disabled' : '';
    echo "<li class='page-item {$prevDisabled}'>
            <a class='page-link pagination-link' href='#' data-page='{$prevPage}'>&laquo;</a>
        </li>";

    // Nomor halaman
    for ($i = 1; $i <= $totalPages; $i++) {
        $active = $i === $page ? 'active' : '';
        echo "<li class='page-item {$active}'>
                <a class='page-link pagination-link' href='#' data-page='{$i}'>{$i}</a>
            </li>";
    }

    // Tombol "Next"
    $nextPage = $page + 1;
    $nextDisabled = $page >= $totalPages ? 'disabled' : '';
    echo "<li class='page-item {$nextDisabled}'>
            <a class='page-link pagination-link' href='#' data-page='{$nextPage}'>&raquo;</a>
        </li>";

    echo '</ul></nav>';
    echo '</td></tr>';
?>
