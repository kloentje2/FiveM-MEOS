<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=basisadministratie");
}
if ($_SESSION['role'] != "admin") {
	Header("Location:index.php");
}

if (isset($_GET['id']) AND @$_GET['id'] != null) {
	
	
	
	
	//property_black_money ook nog in kijken zit in addon_account_data
	$get = $ddcon->query("SELECT users.identifier, users.firstname, users.lastname, addon_inventory_items.name,addon_inventory_items.count FROM addon_inventory_items INNER JOIN users ON users.identifier = addon_inventory_items.owner WHERE users.aid = '".$con->real_escape_string($_GET['id'])."' AND addon_inventory_items.inventory_name = 'property' AND NOT addon_inventory_items.count = 0");
	$row = $get->fetch_assoc();
	
	$con->query("INSERT INTO 
	huiszoekinglog 
	(
	agent,
	burger,
	ip
	)
	VALUES
	(
	'".$_SESSION['username']."(".$_SESSION['name'].")',
	'".$con->real_escape_string($row['identifier'])."',
	'".$_SERVER['REMOTE_ADDR']."'
	)"
	);
	
	echo "<h1>Uitgevoerde huiszoeking</h1><br>";
	echo "Jij als bevoegd ambtenaar hebt de recherche opdracht gegeven om een huiszoeking uit te voeren bij ".$row['firstname']." ".$row['lastname']." middels een huiszoekingsbevel, de recherche heeft deze taak uitgevoerd en doet verslag.<hr>";
	$get2 = $ddcon->query("SELECT users.firstname, users.lastname, addon_inventory_items.name,addon_inventory_items.count FROM addon_inventory_items INNER JOIN users ON users.identifier = addon_inventory_items.owner WHERE users.aid = '".$con->real_escape_string($_GET['id'])."' AND addon_inventory_items.inventory_name = 'property' AND NOT addon_inventory_items.count = 0");
	while ($row2 = $get2->fetch_assoc()) {
		echo "De recherche heeft ".$row2['count']." maal ".$row2['name']." gevonden<br>";
	}
	$blackmoney = $ddcon->query("SELECT money FROM addon_account_data WHERE owner = '".$row['identifier']."' AND account_name = 'property_black_money'");
	$row3 = $blackmoney->fetch_assoc();
	echo "<hr>De recherche heeft &euro;".$row3['money']." aan contanten gevonden<hr>";
	
	$data = $ddcon->query("SELECT data FROM datastore_data WHERE name='property' AND owner='".$ddcon->real_escape_string($row['identifier'])."'");//Oa wapens
	$rowdata = $data->fetch_assoc();
	$json = json_decode($rowdata['data'],true);
	foreach($json['weapons'] as $key => $value) {
		$wapennaam = $ddcon->query("SELECT name FROM weapons WHERE hash = '".$con->real_escape_string($value['name'])."'");
		$row = $wapennaam->fetch_assoc();
		echo "De recherche heeft een ".$row['name']." gevonden met een munitievoorraad van ".$value['ammo']."<br>";
	}
}

?>
