<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login - QR Code Check In</title>
        <!-- CSS CORE -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ee5974d453.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container p-5">
            <form class="card border-primary w-50 m-auto border border-1">
                <div class="card-header bg-transparent border-primary">
                    Login - Qr Code Check In
                </div>
                <div class="card-body">
                    <div class="input-group mb-3">
                        <span class="input-group-text">
                            <i class="fa-solid fa-user"></i>
                        </span>
                        <input type="text" class="form-control" name="username" placeholder="Username"
                            aria-label="Username" aria-describedby="username">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">
                            <i class="fa-solid fa-key"></i>
                        </span>
                        <input type="password" class="form-control" name="password" placeholder="Password"
                            aria-label="Password" aria-describedby="password">
                    </div>
                </div>
                <div class="card-footer bg-transparent border-primary">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>Login</span>
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>