<?php
    include 'connection.php';

$id_hadiah = $_GET['id_hadiah'] ?? null;

// Cek apakah ada setup pemenang untuk hadiah ini yang belum digunakan
$querySetup = mysqli_query($conn, "
    SELECT sp.no_undian 
    FROM setup_pemenang sp 
    JOIN data_tamu dt ON dt.no_undian = sp.no_undian
    WHERE sp.id_hadiah = '$id_hadiah' 
      AND sp.status = 'pending' 
      AND (dt.menang_undian IS NULL OR dt.menang_undian = '')
    LIMIT 1
");

if ($data = mysqli_fetch_assoc($querySetup)) {
    echo $data['no_undian'];
} else {
    // Ambil random jika tidak ada setup pemenang
    $query = mysqli_query($conn, "
        SELECT no_undian 
        FROM data_tamu 
        WHERE menang_undian IS NULL OR menang_undian = '' 
        ORDER BY RAND() 
        LIMIT 1
    ");

    if ($data = mysqli_fetch_assoc($query)) {
        echo $data['no_undian'];
    } else {
        echo '000000'; // fallback
    }
}

?>