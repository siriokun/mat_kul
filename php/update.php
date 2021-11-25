<?php
header('Content-Type: application/json');
include "./db.php";
$id = (int) $_POST['id'];
$kode = (int) $_POST['kode'];
$name = $_POST['name'];
$sks = (int) $_POST['sks'];
$semester = (int) $_POST['semester'];
$dosen = $_POST['dosen'];
$stmt = $db->prepare("UPDATE jadwal SET kode = ?, name = ?, sks = ?, semester = ?, dosen = ? WHERE id = 
?");
$result =  $stmt->execute([$id, $kode, $name, $sks, $semester, $dosen]);
echo json_encode([
'success' => $result
]);