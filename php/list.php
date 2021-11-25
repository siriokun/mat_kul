<?php
header('Content-Type: application/json');
include "./db.php";
$stmt = $db->prepare("SELECT kode, name, sks, semester, dosen FROM jadwal");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);