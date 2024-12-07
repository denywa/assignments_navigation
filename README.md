# Navigasi Flutter

Proyek Flutter ini menunjukkan struktur navigasi sederhana menggunakan named routes dan pembuatan layar dinamis. Aplikasi ini terdiri dari tiga layar utama: `first_screen`, `second_screen`, dan `third_screen`, serta layar yang dihasilkan secara dinamis berdasarkan input pengguna. Pengguna dapat bernavigasi antar layar ini menggunakan tombol dan bottom navigation bar.

## Instalasi dan Penggunaan

### Prasyarat
- Pastikan Anda telah menginstal Flutter SDK di komputer Anda.
- Pastikan Anda memiliki editor kode seperti Android Studio atau Visual Studio Code.

### Langkah-langkah Instalasi
1. Clone repositori ini ke komputer Anda:
   ```bash
   git clone https://github.com/denywa/assignments_navigation.git
   ```
2. Navigasikan ke direktori proyek:
   ```bash
   cd assignments_navigation
   ```
3. Jalankan perintah berikut untuk menginstal dependensi:
   ```bash
   flutter pub get
   ```

### Cara Menjalankan Aplikasi
1. Hubungkan perangkat Android atau iOS Anda, atau siapkan emulator.
2. Jalankan aplikasi dengan perintah berikut:
   ```bash
   flutter run
   ```

## Struktur Proyek

- **lib/main.dart**: Mengatur named routes dan initial route (rute awal).
- **lib/first_screen.dart**: Berisi widget `FirstScreen` dengan navigasi ke Layar Kedua dan pembuatan layar dinamis.
- **lib/second_screen.dart**: Berisi widget `SecondScreen` dengan navigasi ke Layar Ketiga.
- **lib/third_screen.dart**: Berisi widget `ThirdScreen` dengan navigasi kembali ke Layar Pertama.
- **lib/dynamic_screen.dart**: Menangani pembuatan layar dinamis berdasarkan input pengguna.

## Fitur

- **Named Routes**: Aplikasi menggunakan rute bernama untuk navigasi, yang diatur pada file `main.dart`.
- **Bottom Navigation Bar**: First, second, dan third screen memiliki bottom navigation bar untuk beralih antar layar.
- **Pembuatan Layar Dinamis**: Pengguna dapat memasukkan angka (1-100) untuk menghasilkan sejumlah layar dengan konten unik.
- **Penanganan Kesalahan**: Penanganan kesalahan navigasi dengan umpan balik pengguna melalui dialog.

## Layar

- **first_screen**: Layar awal dengan field teks untuk input pengguna dan tombol untuk navigasi.
- **second_screen**: Berisi tombol untuk bernavigasi ke Layar Ketiga.
- **third_screen**: Berisi tombol untuk bernavigasi kembali ke Layar Pertama.
- **dynamic_screen**: Menghasilkan beberapa layar berdasarkan input pengguna.

## Navigasi

- **first_screen**: 
  - Tombol: Bernavigasi ke Layar Kedua atau menghasilkan layar dinamis.
  - Bottom NavBar: Memungkinkan beralih ke Layar Kedua dan Ketiga.

- **second_screen**:
  - Tombol: Bernavigasi ke Layar Ketiga.
  - Bottom NavBar: Memungkinkan beralih ke Layar Pertama dan Ketiga.

- **third_screen**:
  - Tombol: Bernavigasi kembali ke Layar Pertama.
  - Bottom NavBar: Memungkinkan beralih ke Layar Pertama dan Kedua.

- **dynamic_screen**:
  - Tombol: Bernavigasi ke layar yang dihasilkan berdasarkan input pengguna.
  - Back button: Memungkinkan beralih ke First Screen.

## Pendekatan dan Tantangan

### Pendekatan
Dalam membangun aplikasi ini, saya memanfaatkan kode yang sudah saya buat pada tugas lab activity sebelumnya dan memodifikasi kodenya sesuai dengan tugas yang diberikan pada assignment sekarang. Saya menambahkan fitur dynamic screen yang dapat menggenerate screen yang jumlahnya sesuai dengan inputan pengguna (1-100). Saya juga menambahkan arguments untuk passing data antar layar, dan saya juga memodifikasi navigasi untuk `Back` button sehingga semua tombol ini akan memindahkan ke `first_screen` 

### Tantangan
Salah satu tantangan yang saya hadapi dalam pembuatan aplikasi ini adalah saya bingung ketika ingin membuat semua tombol navigasi `Back` button kembali ke first screen, karena awalnya saya menggunakan `Navigator.pushNamed` sehingga semua `Back` buttonnya mengembalikan ke halaman sebelumnya dan bukan kembali ke first screen. Solusi yang saya lakukan untuk masalah ini adalah saya mengganti tombol navigasi untuk berpindah kehalaman selanjutnya menggunakan `Navigator.pushNamedAndRemoveUntil` dan membuat `Back` button tersendiri pada setiap appbar kecuali pada first screen sehingga semua `Back` button bisa saya atur untuk berpindah kembali ke first screen.
