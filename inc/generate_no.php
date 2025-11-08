<?php
    require_once 'connection.php';

    // Ambil no_regist terakhir
    $result = mysqli_query($conn, "SELECT MAX(no_regist) AS max_reg FROM data_tamu");
    $data = mysqli_fetch_assoc($result);
    $last_reg = $data['max_reg'];
    $next_reg = ($last_reg) ? str_pad((int)$last_reg + 1, 5, '0', STR_PAD_LEFT) : "00001";

    // Ambil no_undian terakhir
    $result2 = mysqli_query($conn, "SELECT MAX(no_undian) AS max_undi FROM data_tamu");
    $data2 = mysqli_fetch_assoc($result2);
    $last_undian = $data2['max_undi'];
    $next_undian = ($last_undian) ? str_pad((int)$last_undian + 1, 3, '0', STR_PAD_LEFT) : "001";

    echo json_encode([
        'no_regist' => $next_reg,
        'no_undian' => $next_undian
    ]);
?>