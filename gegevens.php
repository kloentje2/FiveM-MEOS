<?php
error_reporting(0);
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=basisadministratie");
}

if ($_SESSION['rang'] == "G4S") {
	Header("Location: index");
}
if ($_SESSION['role'] == "anwb") {
	Header("Location: index");
}

if (@$_GET['action'] == "delete") {
	$delete = $con->query("DELETE FROM informatie WHERE id='".$con->real_escape_string($_GET['verbaal'])."'");
	Header("Location: gegevens?id=".$_GET['persoon']);
}

if (@$_GET['action'] == "delfine") {
	if ($_GET['id'] == "all") {
		$ddcon->query("DELETE FROM billing WHERE identifier='".$ddcon->real_escape_string($_GET['steam'])."'");
	} else {
		$ddcon->query("DELETE FROM billing WHERE id='".$ddcon->real_escape_string($_GET['id'])."'");
	}
	Header("Location: gegevens?id=".$_GET['persoon']);
}

if (@$_GET['action'] == "beslag") {
	$ddcon->query("DELETE FROM owned_vehicles WHERE id='".$ddcon->real_escape_string($_GET['id'])."'");
	$con->query("INSERT INTO beslaglog (ip,agent,burger,kenteken,voertuig) VALUES ('".$_SERVER['REMOTE_ADDR']."','".$con->real_escape_string($_SESSION['name'])."','".$con->real_escape_string($_GET['user'])."','".$con->real_escape_string($_GET['kenteken'])."','".$con->real_escape_string($_GET['voertuig'])."')");
	Header("Location: gegevens?id=".$_GET['persoon']);

}

if (@$_GET['action'] == "invorderen") {
	//echo $_GET['owner'];
	//echo "<br>";
	//exit;
	$ddcon->query("DELETE FROM user_licenses WHERE owner='".$ddcon->real_escape_string($_GET['owner'])."' AND type='drive_bike'"); //A
	$ddcon->query("DELETE FROM user_licenses WHERE owner='".$ddcon->real_escape_string($_GET['owner'])."' AND type='drive_truck'"); //C
	$ddcon->query("DELETE FROM user_licenses WHERE owner='".$ddcon->real_escape_string($_GET['owner'])."' AND type='dmv'"); //Theorie
	$ddcon->query("DELETE FROM user_licenses WHERE owner='".$ddcon->real_escape_string($_GET['owner'])."' AND type='drive'"); //B
	$ddcon->query("DELETE FROM user_licenses WHERE owner='".$ddcon->real_escape_string($_GET['owner'])."' AND type='bus'"); //Bus
	$con->query("INSERT INTO invorderlog (agent,burger,ip) VALUES ('".$_SESSION['username']."(".$_SESSION['name'].")','".$con->real_escape_string($_GET['owner'])."','".$_SERVER['REMOTE_ADDR']."')");
	Header("Location: gegevens?id=".$_GET['persoon']);
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	if ($_POST['form'] == "notitie") {
		$insert = $con->query("
		INSERT INTO
		informatie
		(
		gameid,
		verbalisant,
		datum,
		notitie,
		sanctie
		) VALUES
		(
		'".$con->real_escape_string($_POST['gameid'])."',
		'".$con->real_escape_string($_POST['verbalisant'])."',
		'".$con->real_escape_string($_POST['datum'])."',
		'".$con->real_escape_string($_POST['notitie'])."',
		'".$con->real_escape_string($_POST['sanctie'])."'
		)
		");
		
		if ($insert) {
			Header("Location:gegevens?id=".$_POST['gameid']."&status=ok");
		} else {
			Header("Location:gegevens?id=".$_POST['gameid']."&status=kut");
		}
	}
	
	if ($_POST['form'] == "recherche") {
		$insert = $con->query("
		INSERT INTO
		recherche
		(
		rechercheur,
		notitie,
		datum,
		burger
		) VALUES
		(
		'".$con->real_escape_string($_POST['verbalisant'])."',
		'".$con->real_escape_string($_POST['notitie'])."',
		'".$con->real_escape_string($_POST['datum'])."',
		'".$con->real_escape_string($_POST['gameid'])."'
		)
		");
		
		if ($insert) {
			Header("Location:gegevens?id=".$_POST['gameid']."&status=ok2");
		} else {
			Header("Location:gegevens?id=".$_POST['gameid']."&status=kut2");
		}
	}
	
	
	if ($_POST['form'] == "jail") {
		$insert = $ddcon->query("
		INSERT INTO
		jail
		(
		identifier,
		jail_time
		) VALUES
		(
		'".$ddcon->real_escape_string($_POST['steam'])."',
		'".$ddcon->real_escape_string($_POST['time'])."'
		)
		");
		
		if ($insert) {
			Header("Location:gegevens?id=".$_POST['persoon']."&status=ok");
		} else {
			Header("Location:gegevens?id=".$_POST['persoon']."&status=kut");
		}
	}
	
	if ($_POST['form'] == "kladblok") {
		$x = $con->query("SELECT * FROM kladblok WHERE userid = '".$_GET['id']."' LIMIT 1");
		if ($x->num_rows == 1) {
			$con->query("UPDATE kladblok SET text = '".$_POST['kladblok']."' WHERE userid='".$_GET['id']."'");
		} else {
			$con->query("INSERT INTO kladblok (userid,text) VALUES ('".$_GET['id']."','".$_POST['kladblok']."')");
		}
	}
}

$mensenq = $ddcon->query("SELECT firstname, lastname, dateofbirth, aid, sex, height, job_grades.label as jobrank, jobs.label as job, users.identifier as identifier FROM users INNER JOIN job_grades ON (users.job = job_grades.job_name AND users.job_grade = job_grades.grade) INNER JOIN jobs ON users.job = jobs.name WHERE aid= '".$ddcon->real_escape_string($_GET['id'])."' LIMIT 1");
$row = $mensenq->fetch_assoc();

$steamid = $row['identifier'];

$notities = $con->query("SELECT * FROM informatie WHERE gameid = '".$con->real_escape_string($_GET['id'])."' ORDER BY id DESC");
$voertuigen = $ddcon->query("SELECT id,vehicle FROM owned_vehicles WHERE owner = '".$row['identifier']."'");

$aid = $row['aid'];
//var_dump($voertuigen);
//exit;

$rijbewijs_theorie = $ddcon->query("SELECT * FROM user_licenses WHERE type='dmv' AND owner='".$row['identifier']."' LIMIT 1");
$rijbewijs_a = $ddcon->query("SELECT * FROM user_licenses WHERE type='drive_bike' AND owner='".$row['identifier']."' LIMIT 1");
$rijbewijs_b = $ddcon->query("SELECT * FROM user_licenses WHERE type='drive' AND owner='".$row['identifier']."' LIMIT 1");
$rijbewijs_c = $ddcon->query("SELECT * FROM user_licenses WHERE type='drive_truck' AND owner='".$row['identifier']."' LIMIT 1");
$rijbewijs_bus = $ddcon->query("SELECT * FROM user_licenses WHERE type='bus' AND owner='".$row['identifier']."' LIMIT 1");

$rijbewijzen = "";

if ($rijbewijs_theorie->num_rows == 1) {
	$rijbewijzen .= "Theorie\n"; 
}
if ($rijbewijs_a->num_rows == 1) {
	$rijbewijzen .= "A\n";
}
if ($rijbewijs_b->num_rows == 1) {
	$rijbewijzen .= "B\n";
}
if ($rijbewijs_c->num_rows == 1) {
	$rijbewijzen .= "C\n";
}
if ($rijbewijs_bus->num_rows == 1) {
	$rijbewijzen .= "Bus\n";
}

$kladblok = $con->query("SELECT text FROM kladblok WHERE userid = '".$_GET['id']."'");
$rowKladblok = $kladblok->fetch_assoc();

//LiveLog
if (!isset($_GET['nolog'])) {
	$insert = $con->query("INSERT INTO livelog (agent,burger,burgerid,ip) VALUES ('".htmlspecialchars($_SESSION['name'])."','".htmlspecialchars($row['firstname'])." ".htmlspecialchars($row['lastname'])."','".$_GET['id']."','".$_SERVER['REMOTE_ADDR']."')");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Dendam - Gegevens <?php echo htmlspecialchars($row['firstname'])." ".htmlspecialchars($row['lastname']); ?></title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  
  <!-- datatables -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<link rel="icon" type="image/png" href="favicon.ico" />
<meta name="theme-color" content="<?php echo $browser_color; ?>">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="/">Dendam - MEOS</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="index">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="basisadministratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text"><u>Basisadministratie</u></span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="voertuigregistratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Voertuigregistratie</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="training">
            <i class="fa fa-fw fa-book"></i>
            <span class="nav-link-text">Training</span>
          </a>
        </li>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="aangiftes">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Aangifteadministratie</span>
          </a>
        </li>
				<?php if ($_SESSION['role'] == "admin") { ?>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="gebruikers">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text">Gebruikersadministratie</span>
          </a>
        </li>
		
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="jaillog">
            <i class="fa fa-fw fa-cogs"></i>
            <span class="nav-link-text">Gevangenislogboek</span>
          </a>
        </li>
		<?php } ?>
      </ul>
      
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="basisadministratie">Basisadministratie</a></li>
        <li class="breadcrumb-item active"><?php echo htmlspecialchars($row['firstname'])." ".htmlspecialchars($row['lastname']); ?></li>
      </ol>

		<form method="POST">
			<em>Voornaam:</em><br>
			<input type="text" class="form-control" value="<?php echo htmlspecialchars($row['firstname']); ?>" readonly><br>
			<em>Achternaam:</em><br>
			<input type="text" class="form-control" value="<?php echo htmlspecialchars($row['lastname']); ?>" readonly><br>
			<em>Geboortedatum:</em><br>
			<input type="text" class="form-control" value="<?php echo htmlspecialchars($row['dateofbirth']); ?>" readonly><br>
			<hr>
			<em>Baan:</em><br>
			<input type="text" class="form-control" value="<?php echo htmlspecialchars($row['job']); ?>" readonly><br>
			<em>Functie:</em><br>
			<input type="text" class="form-control" value="<?php echo htmlspecialchars($row['jobrank']); ?>" readonly><br>
			<hr>
			<em>Rijvaardigheidsbewijzen:</em><br>
			<textarea rows="5" class="form-control" readonly><?php echo htmlspecialchars($rijbewijzen); ?></textarea>
			<?php if (@$_SESSION['rang'] != "G4S") {?><a class="btn btn-danger" href="?action=invorderen&owner=<?php echo $row['identifier']; ?>&persoon=<?php echo $aid; ?>">Invorderen</a><br><?php } ?><br>
			<?php if (@$_SESSION['role'] == "admin") {
			?>
				<a class="btn btn-primary" href="huiszoekingafschrift?id=<?php echo $_GET['id']; ?>">Huiszoeking uitvoeren</a><br>
				<b>Voer deze actie UITSLUITEND uit met toestemming van de Minister President</b>
			<?php
			}			
			?>
			<hr>
			
		</form>
		<?php if (@$_SESSION['rang'] != "G4S") {?>
		<form method="POST">
		<input type="hidden" name="form" value="notitie">
		<input type="hidden" name="gameid" value="<?php echo $row['aid']; ?>">
		<div class="col-sm-2"><input required name="verbalisant" class="form-control" type="text" value="<?php echo htmlspecialchars($_SESSION['name']); ?>" readonly></div><div class="col-sm-2"><input required name="datum" class="form-control" type="date"></div>
		<div class="col-sm-2"><input required name="sanctie" class="form-control" type="text" placeholder="Sanctie"></div>
		<br>
		<div class="col-sm-12"><textarea required name="notitie" placeholder="Beschrijf incident / notitie" class="form-control"></textarea></div><br>
		<input type="submit" class="btn btn-success btn-block" value="Opslaan">
		</form>
		<?php } ?>
		<hr>
		<?php if (@$_SESSION['rang'] != "G4S") {?>
		<form method="POST">
			Wanneer iemand de stad heeft verlaten kan je hem via deze optie opsluiten. Dit werkt <b><u>uitsluitend</u></b> als de persoon de stad al uit is<br>
			<em><b>Gevangenistijd (seconde):</b></em>
			<input type="hidden" name="form" value="jail">
			<input type="hidden" name="persoon" value="<?php echo $_GET['id']; ?>">
			<input type="hidden" name="steam" value="<?php echo $row['identifier']; ?>">
			<input type="number" name="time" class="form-control"><br>
			<input type="submit" value="Opsluiten" class="btn btn-danger btn-block">
		</form>
		<?php } ?>
		<hr>
		<h2>Notities</h2>
		<table id="badm" class="table">
		  <tr>
			<th>Registratienummer</th>
			<th>Verbalisant</th>
			<th>Datum</th> 
			<th>Notitie</th>
			<th>Sanctie</th>
			<?php if ($_SESSION['role'] == "admin") { ?><th>Actie</th><?php } ?>
		  </tr>
		  <?php
		  if ($notities->num_rows == 0) {
			  echo "<center>Geen feiten bekend</center><br>";
		  } else {
		  while ($row = $notities->fetch_assoc()) {  
		  $meuk = preg_replace( "/\r|\n/", "", $row['notitie'] );
		  ?>
		  <tr>
			<td><?php echo $row['id']; ?></td>
			<td><?php echo $row['verbalisant']; ?></td>
			<td><?php echo $row['datum']; ?></td> 
			<td onclick="alert('<?php echo addslashes($meuk); ?>');"><?php echo substr($row['notitie'],0,50); if (strlen($row['notitie']) > 49) { echo "..."; } ?> </td>
			<td><?php echo $row['sanctie']; ?></td> 
			<?php if ($_SESSION['role'] == "admin") { ?><td><a href="?action=delete&verbaal=<?php echo $row['id']; ?>&persoon=<?php echo $aid; ?>">Verwijderen</a></td><?php } ?>
		  </tr>
		  <?php 
		  }
		  }
		  ?>
		</table>
		<hr>
		<h2>Voertuigen</h2>
		<table id="badm" class="table">
		  <tr>
			<th>Kenteken vervoersmiddel</th>
			<th>Status</th>
			<th>Modelnaam voertuig</th>
			<?php if ($_SESSION['role'] == "admin") { ?><th>Actie</th><?php } ?>
			
		  </tr>
		  <?php
		  
			  //echo "Geen feiten geregistreerd";
		  if ($voertuigen->num_rows == 0) {
			  echo "<center>Geen voertuigen geregistreerd</center><br>";
		  } else {
		  while ($roww = $voertuigen->fetch_assoc()) {  
		  $vehicle = json_decode($roww['vehicle']);
		  $s = $con->query("SELECT id,date FROM rdwwok WHERE voertuigid = '".$roww['id']."'");
		  if ($s->num_rows == 1) {
			  $status = "<div style='color:red;font-weight:bold;'>Afgekeurd</div>";
			  $statusplain = "Afgekeurd";
		  } else {
			  $status = "<div style='color:green;font-weight:bold;'>Goedgekeurd</div>";
			  $statusplain = "Goedgekeurd";
		  }
		  $t = $s->fetch_assoc();
		  
		  //Get vehicle model
		  //Insert magic 
		  //echo "<pre>";
		 // var_dump($vehicle);
		  $voertuigq = $ddcon->query("SELECT name FROM vehicles WHERE hash='".$vehicle->model."' LIMIT 1");
		  $rowv = $voertuigq->fetch_assoc();
		  
		  ?>
		  <tr>
			<td><a href="rdw?kenteken=<?php echo $vehicle->plate; ?>"><?php echo $vehicle->plate; ?></a></td>
			<td><?php echo $status; ?> <?php if ($statusplain == "Afgekeurd") { ?>(<?php echo $t['date']; ?>)<?php } ?></td>
			<td><?php echo $rowv['name']; ?></td>
			<?php if ($_SESSION['role'] == "admin") { ?><td><a href="?action=beslag&id=<?php echo $roww['id']; ?>&user=<?php echo $steamid ?>&kenteken=<?php echo $vehicle->plate; ?>&voertuig=<?php echo $vehicle->model; ?>&persoon=<?php echo $aid; ?>">In beslag nemen</a></td><?php } ?>
		  </tr>
		  <?php 
		  }
		  }
		  //exit;
		  ?>
		</table>
		<hr>
		<!--<h2>Invoeren bekeuring</h2>-->
		<?php
			$totaalboetes = $ddcon->query("SELECT sum(amount) as a FROM billing WHERE identifier = '".$steamid."' AND target = 'society_police'");
			$totaalboetesrow = $totaalboetes->fetch_assoc();
		?>
		<h2>Openstaande bekeuringen (&euro;<?php if ($totaalboetesrow['a'] == null) { echo "0"; } else { echo $totaalboetesrow['a']; } ?>)</a></h2>
		<a class="btn btn-primary" href="/boete?persoon=<?php echo $_GET['id']; ?>">Verbaal aanzeggen</a> &nbsp; <?php if ($_SESSION['role'] == "admin") { ?><a href="?action=delfine&id=all&persoon=<?php echo $aid; ?>&steam=<?php echo $row['identifier']; ?>" class="btn btn-danger">Alles verwijderen</a><?php } ?><br>
		<table id="badm" class="table">
		  <tr>
			<th>Volgnummer</th>
			<th>Reden</th>
			<th>Verbalisant</th>
			<th>Bedrag</th>
			<?php if ($_SESSION['role'] == "admin") { ?><th>Actie</th><?php } ?>
		  </tr>
		  <?php

		  $boetesq = $ddcon->query("SELECT id,label,amount,date,sender FROM billing WHERE identifier = '".$steamid."' AND target = 'society_police'");
		  while ($row = $boetesq->fetch_assoc()) {
		  if (substr($row['sender'],0,6) == "steam:") {
			  $verbalisantq = $ddcon->query("SELECT CONCAT(LEFT(UCASE(firstname),1),'.',UCASE(lastname)) as verbalisant FROM users WHERE identifier = '".$row['sender']."'");
			  $vrow = $verbalisantq->fetch_assoc();
			  $varbalisant = $vrow['verbalisant'];
		  } else {
			  if ($row['sender'] != NULL) {
				$verbalisant = $row['sender'];
			  } else {
				  $verbalisant = "Flitspaal";
			  }
		  }
		  ?>
		  <tr>
			<td><?php echo $row['id'] ?></td>
			<td><?php echo $row['label']; ?></td>
			<td><?php echo $verbalisant; ?></td>
			<td>&euro; <?php echo $row['amount']; ?></td>
			<?php if ($_SESSION['role'] == "admin") { ?><td><a href="?action=delfine&id=<?php echo $row['id']; ?>&persoon=<?php echo $aid; ?>">Verwijderen</a></td><?php } ?>
		  </tr>
		  <?php 
		  }
		  ?>
		</table>
		<hr>
		<h2>Kladblok</h2>
		<form method="POST">
			<input type="hidden" name="form" value="kladblok">
			<textarea name="kladblok" class="form-control" placeholder="Dit is een blanco kladblok..."><?php echo htmlspecialchars($rowKladblok['text']); ?></textarea>
			<input type="submit" class="btn btn-success" value="Opslaan">
		</form>
	  </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Dendam</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
  <script>
  $('#badm').DataTable( {
    paging: false
} );
</script>
</body>

</html>
