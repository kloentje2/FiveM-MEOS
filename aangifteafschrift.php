<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=aangifte");
}
$aangifte = $con->query("SELECT * FROM aangifte WHERE id='".$con->real_escape_string($_GET['id'])."'");
$row = $aangifte->fetch_assoc();
?>
<html>
	<head>
		<title>Aangifte <?php echo $_GET['id'] ?></title>
		<link rel="icon" type="image/png" href="favicon.ico" />
		<meta name="theme-color" content="<?php echo $browser_color; ?>">
	</head>
	
	<body onload="window.print();">
		<h1>Aangifteafschrift</h1><hr>
		<h3>PROCES-VERBAAL</h3>
		<b>Naam aangever:</b><br><?php echo $row['aangever_voornaam']." ".$row['aangever_achternaam']; ?> (<?php echo $row['aangever_geslacht']; ?>)<br><br>
		<b>Pleegplaats:</b><br><?php echo $row['pleegplaats']; ?> <br>
		<b>Pleegdatum:</b><br><?php echo $row['pleegdatum']; ?> <br>
		<b>Pleegtijd:</b><br><?php echo $row['pleegtijd']; ?> <br><hr>
		<b>Verbalisant:</b><br><?php echo $row['verbalisant']; ?> <hr>
		<b>Verklaring:</b><br><?php echo $row['verklaring']; ?> <hr>
		<b>Opnamedatum:</b><br><?php echo $row['opnamedatum']; ?> 
	</body>
</html>