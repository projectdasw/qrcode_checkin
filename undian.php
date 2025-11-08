<?php
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
        <title>Doorprize</title>
        <!-- CSS CORE -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/doorprize_custom.css">
        <script src="assets/js/sweetalert2.js"></script>
    </head>
    <body>
        <div class="container-fluid d-flex flex-column justify-content-center align-items-center vh-100">
            <audio id="audio-spin" src="assets/audio/spin.mp3" preload="auto"></audio>
            <audio id="audio-win" src="assets/audio/winner.mp3" preload="auto"></audio>
            <img src="assets/logo-nitradi.webp" class="img-fluid w-50 mb-5" alt="image">
            <div class="row align-items-center mb-3">
                <div class="col-3">
                    <video autoplay muted loop>
                        <source src="assets/lottery.webm" type="video/webm">
                    </video>
                </div>
                <div class="col-9 text-center">
                    <h1 class="bg-primary bg-gradient text-white p-2 rounded-5 shadow-lg">
                        UNDIAN DOORPRIZE
                    </h1>
                    <span class="h5">
                        25th Anniversary PT Nitradi Wahyu Cemerlang
                    </span>
                </div>
            </div>
            <div class="container-fluid d-flex justify-content-center">
                <div class="container d-flex flex-column align-items-center">
                    <select id="pilihHadiah" class="form-select form-select-lg w-50" required>
                        <option selected disabled>-- Pilih Hadiah --</option>
                        <?php
                            $query = "SELECT * FROM data_hadiah ORDER BY id_hadiah";
                            $result = mysqli_query($conn, $query);
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "
                                    <option value='{$row['id_hadiah']}' 
                                            data-nama='{$row['nama_hadiah']}' 
                                            data-jumlah='{$row['jumlah_hadiah']}'>
                                        {$row['nama_hadiah']}
                                    </option>
                                ";
                            }
                        ?>
                    </select>

                    <!-- Tempat info hadiah -->
                    <div id="infoHadiah" class="mt-2 text-success fw-semibold"></div>
                    <div class="d-flex flex-column mb-5">
                        <div class="d-flex flex-row justify-content-center align-items-center gap-3">
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot0">0</div>
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot1">0</div>
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot2">0</div>
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot3">0</div>
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot4">0</div>
                            <div class="slot-box bg-light w-100 border border-1 rounded-4 p-4 shadow-sm" id="slot5">0</div>
                        </div>
                        <div class="d-flex flex-row justify-content-center align-items-center">
                            <button id="putar-slot" class="btn btn-lg btn-primary mx-auto mt-4">
                                <i class="fa-solid fa-gear"></i>
                                <span>Putar Undian</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="container d-flex flex-column">
                    <div class="card">
                        <div class="card-header bg-transparent">
                            <h3 class="m-0">List Pemenang Undian Doorprize</h3>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <thead>
                                    <th>#</th>
                                    <th>No. Undian</th>
                                    <th>Nama Tamu</th>
                                    <th>Hadiah</th>
                                </thead>
                                <tbody id="pemenang-body">
                                    <!-- Data dari get_pemenang.php akan dimuat di sini -->
                                </tbody>
                            </table>
                        </div>
                    </div>
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