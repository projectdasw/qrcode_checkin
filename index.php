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
        <div class="container">
            <h1 class="text-center p-2 mb-3">Absensi Kehadiran Tamu Acara</h1>
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
                    <div class="card">
                        <div class="row g-0 p-2 align-items-center">
                            <div class="col-md-4 text-center">
                                <img src="assets/tamu-img.jpg" class="img-fluid rounded-start" alt="image">
                                <button type="button" class="btn btn-success">Check In</button>
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
                </div>
                <div class="col-5 border border-1">
                    <table class="table">
                        <h4>Data Tamu Undangan</h4>
                        <hr class="m-0">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">First</th>
                                <th scope="col">Last</th>
                                <th scope="col">Handle</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
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