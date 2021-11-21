# os-tarball-checker

> **LAST REVISION**: `REV03 Sun 21 Nov 2021 16:45:48 WIB`

Sebuah skrip sederhana untuk mengecek nilai mingguan mata kuliah Sistem Operasi (OS).

> Copyright (C) 2021 Muhammad Athallah

## CHANGELOG

### REV03
- Mengubah nama skrip menjadi `tarball-checker.sh`.
- Mengubah tujuan direktori file tarball menjadi `/tmp/tarball-checker`, sehingga tidak mengotori direktori pengguna dan menambah fleksibilitas lokasi penempatan skrip (dapat ditaruh di folder mana saja, tidak harus dalam `$HOME/tarball-grade`).
- Mengubah input nama akun pengguna menjadi masukan interaktif (tidak _hard-coded_).

### REV02
- Mengubah input minggu yang ingin dicek menjadi masukan interaktif (tidak _hard-coded_).

## Tata Cara Penggunaan

1. Unduh file `tarball-checker.sh` di dalam mesin virtual.<br>
   ATAU<br>
   Unduh file `tarball-checker.sh` pada komputer utama lalu salin file tersebut ke dalam mesin virtual (dengan menggunakan SCP atau FTP File Manager).<br>
   ATAU<br>
   Buat file `tarball-checker.sh` dan salin kode skrip dari `tarball-checker.sh` yang ada dalam repositori ini ke dalam file tersebut. Jangan lupa untuk mengatur file tersebut menjadi _executable_  (gunakan `chmod +x tarball-checker.sh`).
2. Jalankan skrip `tarball-checker.sh` dengan menggunakan perintah `./tarball-checker.sh`.
3. Masukkan nama akun GitHub-mu dan detail minggu yang ingin dicek (misalkan minggu ke-6, maka inputnya adalah `06`).
4. Voila! Nilaimu akan keluar diikuti dengan benchmark pada minggu tersebut.

## Lisensi

Kode `tarball-checker.sh` memiliki lisensi [AGPL-3.0 License](LICENSE).
