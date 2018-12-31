<?php
require "config.php";
if (isset($_GET['v'])) {
	echo "Start to write new indexes for ";
}
$query = $ddcon->query("SELECT id, vehicle FROM owned_vehicles WHERE plate IS NULL OR plate = ''");
if (isset($_GET['v'])) {
	echo $query->num_rows." vehicles<br>";
}
while ($row = $query->fetch_assoc()) {
	echo "Working on ".$row['id']."";
	$vehicle = json_decode($row['vehicle']);
	$insert = $ddcon->query("UPDATE owned_vehicles SET plate = '".$vehicle->plate."' WHERE id = '".$row['id']."'"); 
	if ($insert) {
		if (isset($_GET['v'])) {
			echo "Index for ".$row['id']." / ".$vehicle->plate." done<br>";
		}
	} else {
		if (isset($_GET['v']) AND isset($_GET['e'])) {
			echo $ddcon->error."<br>";
		}
	}
}
?>