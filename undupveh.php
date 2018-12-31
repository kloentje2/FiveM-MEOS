<?php
require "config.php";
//Eerst even alle voertuigen ophalen
$select = $ddcon->query("SELECT id, vehicle FROM owned_vehicles WHERE plate IS NULL OR plate = ''");
while ($row = $select->fetch_assoc()) { 
	//Assuming that I need every plate
	$vehicle = json_decode($row['vehicle']);
	$lastChar = substr($vehicle->plate,-1);
	if ($lastChar == 9) {
		$lastChar = 0;
	} else {
		$lastChar ++;
	}
	
	$newPlate = substr($vehicle->plate, 0, -1) . $lastChar;
	
	$vehicle->plate = $newPlate;
	
	$vehicle = json_encode($vehicle);
	
	$update = $ddcon->query("UPDATE owned_vehicles SET vehicle = '".$vehicle."' AND plate = '".$newPlate."' WHERE id = '".$row['id']."'");
	
}
?>