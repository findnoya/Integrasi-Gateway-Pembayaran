<?php
include "conn.php";

// Tambahkan header CORS untuk akses dari frontend
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Disable error reporting
error_reporting(0);
ini_set('display_errors', 0);

$response = [];

// Cek metode request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Ambil data ID yang dikirimkan melalui body request JSON
    $data = json_decode(file_get_contents('php://input'), true);
    $id = $data['id'] ?? null;

    if (!$id) {
        $response['status'] = 'error';
        $response['message'] = 'ID is required.';
        echo json_encode($response);
        exit;
    }

    // Ubah status menjadi 'done'
    $update = $mysqli->query("UPDATE pembayaran SET status1 = 'done' WHERE id = $id");

    if (!$update) {
        $response['status'] = 'error';
        $response['message'] = 'Failed to update status to done: ' . mysqli_error($mysqli);
    } else {
        // Kirim status success tanpa data tambahan
        $response['status'] = 'success';
    }
} else {
    $response['status'] = 'error';
    $response['message'] = 'Invalid request method.';
}

// Header JSON dan kirim respons
header('Content-Type: application/json');
echo json_encode($response);
?>
