<?php
header('Content-Type: application/json');
include "./db.php";
$id = (int) $_POST['id'];
$stmt = $db->prepare("SELECT kode, name, sks, semester, dosen FROM jadwal WHERE ID = ?");
$stmt->execute([$id]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);
echo json_encode([
    'result' => $result
]);