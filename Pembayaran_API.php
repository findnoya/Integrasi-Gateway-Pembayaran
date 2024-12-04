<?php
// Include file koneksi
include("conn.php");

// Periksa apakah request menggunakan metode POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Escape input data untuk mencegah SQL Injection
    $barang = mysqli_real_escape_string($mysqli, $_POST['barang']);
    $jumlah_barang = mysqli_real_escape_string($mysqli, $_POST['jumlah_barang']);
    $total_harga = mysqli_real_escape_string($mysqli, $_POST['total_harga']);

    // Query SQL untuk menyisipkan data ke tabel 'pembayaran'
    $sql = "INSERT INTO pembayaran (barang, jumlah_barang, total_harga) VALUES (?, ?, ?)";

    // Siapkan statement menggunakan mysqli_prepare
    $stmt = mysqli_prepare($mysqli, $sql);

    // Periksa apakah statement berhasil disiapkan
    if ($stmt) {
        // Bind parameter ke statement
        mysqli_stmt_bind_param($stmt, "sii", $barang, $jumlah_barang, $total_harga);

        // Eksekusi statement
        if (mysqli_stmt_execute($stmt)) {
            echo "Data berhasil disimpan";
        } else {
            echo "Error: " . mysqli_error($mysqli);
        }

        // Tutup statement
        mysqli_stmt_close($stmt);
    } else {
        echo "Error: " . mysqli_error($mysqli);
    }
}

// Tutup koneksi
mysqli_close($mysqli);
?>
