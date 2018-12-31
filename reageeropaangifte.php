<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=index");
}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$insert = $con->query("INSERT INTO aangifte_reacties
	(
	aangifte,
	reactie,
	author
	)
	VALUES
	(
	'".$con->real_escape_string($_POST['aangifte'])."',
	'".$con->real_escape_string($_POST['reactie'])."',
	'".$con->real_escape_string($_SESSION['name'])."'
	)");
	if ($insert) {
		Header("Location: aangifte?id=".$_POST['aangifte']);
	} else {
		die();
	}
}
?>
