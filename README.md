# os-tarball-checker

> **LAST REVISION**: `REV05 Wed 21 Sep 2022 19:30:00 WIB`

Sebuah skrip sederhana untuk mengecek nilai mingguan mata kuliah Sistem Operasi (OS).

> Copyright (C) 2022 Muhammad Athallah, Hugo Sulaiman Setiawan

## CHANGELOG

### REV05
- Menambahkan **switch** untuk menampilkan menu `help` dan menyimpan file tarball.
- Mengubah alur kerja script dengan menggunakan **pipes**.
- Mengubah format nama dan cara pembuatan folder **temp**

### REV04
- Mengubah masukan nama akun pengguna menjadi otomatis (menggunakan skrip `$USER`).

### REV03
- Mengubah nama skrip menjadi `tarball-checker.sh`.
- Mengubah tujuan direktori file tarball menjadi `/tmp/tarball-checker`, sehingga tidak mengotori direktori pengguna dan menambah fleksibilitas lokasi penempatan skrip (dapat ditaruh di folder mana saja, tidak harus dalam `$HOME/tarball-grade`).
- Mengubah masukan nama akun pengguna menjadi masukan interaktif (tidak _hard-coded_).

### REV02
- Mengubah masukan minggu yang ingin dicek menjadi masukan interaktif (tidak _hard-coded_).

## Tata Cara Penggunaan

1. Unduh file `tarball-checker.sh` di dalam mesin virtual. (direkomendasikan)<br>
   ATAU<br>
   Unduh file `tarball-checker.sh` pada komputer utama lalu salin file tersebut ke dalam mesin virtual (dengan menggunakan SCP atau FTP File Manager).<br>
   ATAU<br>
   Buat file `tarball-checker.sh` dan salin kode skrip dari `tarball-checker.sh` yang ada dalam repositori ini ke dalam file tersebut. Jangan lupa untuk mengatur file tersebut menjadi _executable_  (gunakan perintah `chmod +x tarball-checker.sh`).
2. Jalankan skrip `tarball-checker.sh` dengan menggunakan perintah `./tarball-checker.sh` atau `bash tarball-checker.sh`.
3. Masukkan minggu yang ingin dicek detail nilainya (misalkan minggu ke-6, maka masukannya adalah `06`).
4. Voila! Nilaimu akan keluar diikuti dengan _benchmark_ pada minggu tersebut.

## Lisensi

Kode `tarball-checker.sh` memiliki lisensi [AGPL-3.0 License](LICENSE).
