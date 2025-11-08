// fungsi untuk validasi form default Bootstrap
// Menggunakan JavaScript untuk validasi form
// Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()

// Fungsi untuk menampilkan data tamu
// Menggunakan AJAX untuk mengambil data tamu dari server
function loadData(page = 1, query = '') {
    $.ajax({
        url: "inc/search_master.php",
        method: "POST",
        data: { page: page, query: query },
        success: function(data) {
            $('#tabel-tamu').html(data);
        }
    });
}

// Fungsi untuk menampilkan hasil pencarian data tamu
$(document).ready(function() {
    loadData(); // Muat data awal

    $('#search').on('keyup', function() {
        const query = $(this).val();
        loadData(1, query);
    });

    $(document).on('click', '.pagination a', function(e) {
        e.preventDefault();
        const page = $(this).data('page');
        const query = $('#search').val();
        loadData(page, query);
    });
});

// Fungsi untuk validasi status tamu
// Jika status tamu adalah VIP, maka form 'asal' tidak wajib diisi
// $(document).ready(function() {
//     $('#status').on('change', function() {
//         const status = $(this).val();
//         const $asalInput = $('#asal');

//         if (status === 'VIP') {
//             $asalInput.removeAttr('required');
//         } else {
//             $asalInput.attr('required', 'required');
//         }
//     });
// });

// Fungsi untuk Check In Manual
$(document).ready(function() {
    $(document).on('click', '.btn-checkin', function() {
        const id = $(this).data('id');
        console.log("ID yang dikirim: ", id);

        $.ajax({
            url: 'inc/get_tamu.php',
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: function(data) {
                console.log("Data diterima: ", data); // Debug

                $('#view_tamu #no_regist').val(data.no_regist);
                $('#view_tamu #no_undian').val(data.no_undian);
                $('#view_tamu #nama_tamu').val(data.nama_tamu);
                $('#view_tamu #asal').val(data.asal);
                $('#view_tamu #status').val(data.status);
                $('#view_tamu #kehadiran').val(data.kehadiran);
                $('#view_tamu #keterangan').val(data.keterangan);
            },
            error: function () {
                Swal.fire('Error', 'Data gagal diambil.', 'error');
            }
        });
    });
});

// Fungsi untuk perubahan data tamu
$(document).ready(function() {
    $(document).on('click', '.btn-edit', function() {
        const id = $(this).data('id');
        console.log("ID yang dikirim: ", id);

        $.ajax({
            url: 'inc/get_tamu.php',
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: function(data) {
                console.log("Data diterima: ", data); // Debug

                $('#edit_tamu #no_regist').val(data.no_regist);
                $('#edit_tamu #no_undian').val(data.no_undian);
                $('#edit_tamu #nama_tamu').val(data.nama_tamu);
                $('#edit_tamu #asal').val(data.asal);
                $('#edit_tamu #status').val(data.status);
                $('#edit_tamu #kehadiran').val(data.kehadiran);
                $('#edit_tamu #keterangan').val(data.keterangan);
                $('#edit_tamu #keterangan_hadir').val(data.keterangan_hadir);
            },
            error: function () {
                Swal.fire('Error', 'Data gagal diambil.', 'error');
            }
        });
    });
});

// Fungsi untuk manghapus data tamu
$(document).ready(function() {
    $(document).on('click', '.btn-delete', function() {
        const no_regist = this.dataset.no;
        Swal.fire({
            title: "Yakin ingin menghapus data ini?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Ya, Hapus!",
            cancelButtonText: "Batal"
        }).then((result) => {
            if (result.isConfirmed) {
                fetch("inc/hapus_tamu.php", {
                    method: "POST",
                    body: new URLSearchParams({ no_regist })
                }).then(res => res.text())
                .then(() => {
                    Swal.fire({
                        icon: "success",
                        title: "Berhasil",
                        text: "Data berhasil dihapus",
                        timer: 1500,
                        showConfirmButton: false
                    }).then(() => location.reload());
                });
            }
        });
    });
});

// Fungsi untuk scan QR Code
$(document).ready(function () {
    let inputBuffer = '';
    let lastKeyTime = Date.now();

    $(document).on('keypress', function (e) {
        if ($('input:focus, textarea:focus, select:focus').length > 0) return;

        const currentTime = Date.now();
        const timeDiff = currentTime - lastKeyTime;

        if (timeDiff > 100) {
            inputBuffer = '';
        }

        lastKeyTime = currentTime;

        if (e.key === 'Enter') {
            const kode = inputBuffer.trim();
            inputBuffer = '';

            if (kode !== '') {
                $.ajax({
                    url: 'inc/out_scan.php',
                    method: 'GET',
                    data: { q: kode },
                    dataType: 'json',
                    success: function (data) {
                        if (data.status === "success") {
                            const tamu = data.tamu;
                            const jamSekarang = new Date().toLocaleTimeString('id-ID', {
                                hour: '2-digit',
                                minute: '2-digit',
                                second: '2-digit'
                            });

                            if (tamu.kehadiran === "Belum Hadir") {
                                Swal.fire({
                                    title: 'Data Tamu Ditemukan',
                                    html: `
                                        <form id="checkinForm" class="text-start">
                                            <div class="mb-2">
                                                <label class="form-label">No. Registrasi</label>
                                                <input type="text" class="form-control" id="no_regist" value="${tamu.no_regist}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Nama Tamu</label>
                                                <input type="text" class="form-control" value="${tamu.nama_tamu}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Asal</label>
                                                <input type="text" class="form-control" value="${tamu.asal}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Status</label>
                                                <input type="text" class="form-control" value="${tamu.status}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Jam Kedatangan</label>
                                                <input type="text" class="form-control" value="${jamSekarang}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Keterangan Tamu</label>
                                                <input type="text" class="form-control" value="${tamu.keterangan}" readonly>
                                            </div>
                                            <div class="mb-2">
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
                                        </form>
                                    `,
                                    confirmButtonText: 'Check In',
                                    showCancelButton: true,
                                    preConfirm: () => {
                                        const keteranganHadir = $('#keterangan_hadir').val();
                                        if (!keteranganHadir) {
                                            Swal.showValidationMessage('Mohon pilih keterangan kehadiran tamu');
                                            return false; // 🛑 hentikan jika belum pilih
                                        }
                                        return {
                                            no_regist: tamu.no_regist,
                                            keterangan_hadir: keteranganHadir
                                        }
                                    }
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        const keteranganHadir = $('#keterangan_hadir').val();
                                        checkInTamu(result.value.no_regist, keteranganHadir);
                                    }
                                });
                            }
                            else{
                                Swal.fire({
                                    title: `Tamu Undangan telah hadir`,
                                    html: `
                                        <form id="checkinForm" class="text-start">
                                            <div class="mb-2">
                                                <label class="form-label">No. Registrasi</label>
                                                <input type="text" class="form-control" id="no_regist" value="${tamu.no_regist}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Nama Tamu</label>
                                                <input type="text" class="form-control" value="${tamu.nama_tamu}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Asal</label>
                                                <input type="text" class="form-control" value="${tamu.asal}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Status</label>
                                                <input type="text" class="form-control" value="${tamu.status}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Jam Kedatangan</label>
                                                <input type="text" class="form-control" value="${tamu.jam_kedatangan}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Keterangan Tamu</label>
                                                <input type="text" class="form-control" value="${tamu.keterangan}" readonly>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label">Keterangan Kehadiran</label>
                                                <input type="text" class="form-control" value="${tamu.keterangan_hadir}" readonly>
                                            </div>
                                        </form>
                                    `,
                                });
                            }
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'QR Code Tidak Valid',
                                text: data.message,
                                timer: 1500,
                                showConfirmButton: false
                            });
                        }
                    },
                    error: function () {
                        Swal.fire({
                            icon: 'error',
                            title: 'Kesalahan Server',
                            text: 'Gagal terhubung ke server',
                        });
                    }
                });
            }
        } else {
            inputBuffer += e.key;
        }
    });
});

// Fungsi tombol Check In
function checkInTamu(no_regist, keterangan_hadir) {
    $.ajax({
        url: 'inc/checkin_tamu.php',
        method: 'POST',
        data: {
            no_regist: no_regist,
            keterangan_hadir: keterangan_hadir
        },
        dataType: 'json',
        success: function (res) {
            if (res.status === 'success') {
                Swal.fire({
                    icon: 'success',
                    title: 'Check-In Berhasil',
                    text: res.message,
                    timer: 1500,
                    showConfirmButton: false
                }).then(() => location.reload());
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Gagal Check-In',
                    text: res.message
                });
            }
        },
        error: function () {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Gagal menghubungi server'
            });
        }
    });
}


let currentPage = 1;
function loadPemenang(page = 1) {
    currentPage = page;
    $('#pemenang-body').load('inc/get_winner.php?page=' + page);
}

$(document).on('click', '.pagination-link', function (e) {
    e.preventDefault();
    const page = $(this).data('page');
    loadPemenang(page);
});

loadPemenang();

setInterval(() => {
    loadPemenang(currentPage);
}, 5000);


// Tampilkan informasi hadiah saat halaman dimuat
$('#pilihHadiah').on('change', function () {
    const nama = $('option:selected', this).data('nama');
    const jumlah = parseInt($('option:selected', this).data('jumlah'));
    const idHadiah = $(this).val();

    // Info visual
    if(jumlah === 1) {
        $('#infoHadiah').html(`<span class="badge text-bg-warning fs-2 mt-2 mb-2">🎁 <strong>${nama}</strong> (tersisa ${jumlah} pcs)</span>`);
    }
    else if(jumlah === 0) {
        $('#infoHadiah').html(`<span class="badge text-bg-danger fs-2 mt-2 mb-2">Undian Hadiah <strong>${nama}</strong> telah habis</span>`);
    }
    else {
        $('#infoHadiah').html(`<span class="badge text-bg-primary fs-2 mt-2 mb-2">🎁 <strong>${nama}</strong> (${jumlah} pcs tersedia)</span>`);
    }

    // Validasi untuk Grand Prize (Sepeda Listrik)
    $.get('inc/cek_sisa_hadiah.php', { id_hadiah: idHadiah }, function (res) {
        const data = JSON.parse(res);
        if (!data.boleh) {
            Swal.fire({
                icon: 'warning',
                title: 'Belum Waktunya!',
                text: 'Hadiah Doorprize habiskan dulu ya sebelum Grand Prize.'
            });
            $('#putar-slot').prop('disabled', true);
        } else {
            $('#putar-slot').prop('disabled', false);
        }
    });
});


// Fungsi untuk memutar undian
$(document).ready(function () {
    $('#putar-slot').click(function () {
        const idHadiah = $('#pilihHadiah').val();
        if (!idHadiah) {
            Swal.fire({
                icon: 'warning',
                title: 'Pilih Hadiah Dulu!',
                text: 'Sebelum memutar undian, silakan pilih hadiah terlebih dahulu.',
            });
            return;
        }

        const audioSpin = document.getElementById('audio-spin');
        const audioWin = document.getElementById('audio-win');

        let slotCount = 6;
        let slotInterval = [];
        let hasilUndian = '';

        $('#putar-slot').prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Memutar...');

        // Play backsound spin
        audioSpin.currentTime = 0;
        audioSpin.play();

        // Ambil nomor undian dari server
        $.get('inc/get_winnerslot.php', { id_hadiah: idHadiah }, function (response) {
            hasilUndian = response.trim();
            console.log("Nomor undian:", hasilUndian);

            // Jalankan animasi tiap slot
            for (let i = 0; i < slotCount; i++) {
                const slotID = '#slot' + i;
                slotInterval[i] = setInterval(() => {
                    let angka = Math.floor(Math.random() * 10);
                    $(slotID).text(angka);
                }, 50 + (i * 50));
            }

            // Hentikan animasi secara bertahap
            for (let i = 0; i < slotCount; i++) {
                setTimeout(() => {
                    clearInterval(slotInterval[i]);
                    $('#slot' + i).text(hasilUndian[i]);

                    if (i === slotCount - 1) {
                        // Hentikan backsound spin
                        audioSpin.pause();
                        audioSpin.currentTime = 0;

                        $('#putar-slot').prop('disabled', false).html('<i class="fa-solid fa-gear"></i> Putar Undian');

                        // Ambil hasil pemenang dari server
                        $.get('inc/tampil_pemenang.php', {
                            no_undian: hasilUndian,
                            id_hadiah: idHadiah
                        }, function (response) {
                            // Mainkan backsound winner
                            audioWin.currentTime = 0;
                            audioWin.play();

                            Swal.fire({
                                icon: 'success',
                                title: '🎉 Selamat!',
                                html: response,
                                showConfirmButton: false,
                                allowOutsideClick: false
                            });

                            updateInfoHadiah();
                        });
                    }
                }, 1500 + (i * 500));
            }
        });
    });

    function updateInfoHadiah() {
        const selected = $('#pilihHadiah option:selected');
        let jumlah = parseInt(selected.data('jumlah')) - 1;
        let nama = selected.data('nama');

        selected.data('jumlah', jumlah);

        let infoHTML = '';
        if (jumlah <= 0) {
            infoHTML = `<span class="badge text-bg-danger fs-2 mt-2 mb-2">Undian Hadiah <strong>${nama}</strong> telah habis</span>`;
        } else if (jumlah === 1) {
            infoHTML = `<span class="badge text-bg-warning fs-2 mt-2 mb-2">🎁 <strong>${nama}</strong> (tersisa ${jumlah} pcs)</span>`;
        } else {
            infoHTML = `<span class="badge text-bg-primary fs-2 mt-2 mb-2">🎁 <strong>${nama}</strong> (${jumlah} pcs tersedia)</span>`;
        }

        $('#infoHadiah').html(infoHTML);
    }
});

function simpanPemenang(no_undian, id_hadiah) {
    $.post('inc/simpan_pemenang.php', {
        no_undian: no_undian,
        id_hadiah: id_hadiah
    }, function (res) {
        const result = JSON.parse(res);
        if (result.status === 'success') {
            Swal.fire({
                icon: 'success',
                title: 'Selamat kepada Pemenang!',
                confirmButtonText: 'Lanjutkan Undian'
            });
            loadPemenang(); // reload list
            updateInfoHadiah();
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Gagal Simpan!',
                text: result.msg
            });
        }
    });
}

function skipPemenang() {
    Swal.fire({
        icon: 'info',
        title: 'Pemenang Dilewati',
        text: 'Lanjut Putar Undian lagi gak sih',
    });
}

