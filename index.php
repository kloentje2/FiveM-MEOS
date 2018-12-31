<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login");
}
$inw = $ddcon->query("SELECT * FROM users");
$hvs = $ddcon->query("SELECT * FROM users WHERE job = 'police' OR job = 'ambulance'");
$gev = $ddcon->query("SELECT * FROM jail");
$voe = $ddcon->query("SELECT * FROM owned_vehicles");
$moncon = $ddcon->query("SELECT sum(money) as tot FROM users WHERE NOT aid = '13' AND NOT aid = '753' AND NOT aid = '221' AND NOT aid = '1602'");
$monconr = $moncon->fetch_assoc();

$monban = $ddcon->query("SELECT sum(bank) as tot FROM users WHERE NOT aid = '13' AND NOT aid = '753' AND NOT aid = '221' AND NOT aid = '1602'");
$monbanr = $monban->fetch_assoc();

$openb = $ddcon->query("SELECT sum(amount) as tot FROM billing WHERE target='society_police'");
$openbr = $openb->fetch_assoc();

$logc = $con->query("SELECT * FROM livelog");

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	if (isset($_POST['anotitie']) AND trim($_POST['anotitie']) != "") {
		$con->query("INSERT INTO anotitie (user_id,text) VALUES ('".$con->real_escape_string($_SESSION['id'])."','".$con->real_escape_string($_POST['anotitie'])."')");
		Header("Location:index");
	}
}

if (@$_GET['action'] == "deleteanotitie") {
	$con->query("DELETE FROM anotitie WHERE id = '".$_GET['id']."'");
	Header("Location: index.php");
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
  <title>Dendam</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <!-- <link rel="icon" type="image/png" href="favicon.ico" /> -->
<meta name="theme-color" content="<?php echo $browser_color; ?>">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="#"><img id="logo-meos" src="img/logo.png"></a><p id="header-text">Meos</p>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text"><u>Dashboard</u></span>
          </a>
        </li>
		<?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="basisadministratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Basisadministratie</span>
          </a>
        </li>
	  <?php } ?>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="voertuigregistratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Voertuigregistratie</span>
          </a>
        </li>
			  <?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
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
	  <?php } ?>
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
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="exit.php">
            <i class="fa fa-fw fa-cogs"></i>
            <span class="nav-link-text">Uitloggen</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <!--<a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>-->
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        
      </ol>
	  <div class="row">
	 <?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
        <div class="col-xl-3 col-sm-6 mb-3">
        <a href="basisadministratie" class="fill-div"><div class="bg-primary knop">
              <img id="icon-meos" src="img/user-shape.svg"><p class="text-button">Persoon</p>
          </div></a>
        </div>
	  <?php } ?>
        <div class="col-xl-3 col-sm-6 mb-3">
        <a href="voertuigregistratie" class="fill-div"><div class="bg-primary knop">
              <img id="icon-meos" src="img/sports-car.svg"><p class="text-button">Vervoersmiddel</p>
          </div></a>
        </div>
		<?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
        <div class="col-xl-3 col-sm-6 mb-3">
        <a href="aangiftes" class="fill-div"><div class="bg-primary knop">
              <img id="icon-meos" src="img/file.svg"><p class="text-button">Aangifte</p>
          </div></a>
        </div>
		  <?php } ?>
        <div class="col-xl-3 col-sm-6 mb-3">
        <a href="beveiligingscentrum" class="fill-div"><div class="bg-primary knop">
              <img id="icon-meos" src="img/White_lock.svg"><p class="text-button">Beveiligingscentrum</p>
          </div></a>
        </div>
	
      </div>
      <h1>
	  Welkom in Dendam!
	  </h1><br>
	  <b><u>Dit systeem is uitsluitend voor geautoriseerd gebruik. Misbruik van dit systeem kan leiden tot ontslag en/of strafvervolging</u></b><br>
	  <br>
	  <br>
	  <?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
	  <h1>Algemene notities</h1>
	  <form method="POST">
		<textarea name="anotitie" class="form-control" placeholder="Notitie"></textarea>
		<input type="submit" class="btn btn-success" value="Bewaren">
	  </form>
	  <hr>
	  <?php
	  $getNotities = $con->query("SELECT n.id as nid, u.id, u.name, n.text, n.date FROM anotitie AS n INNER JOIN users AS u ON u.id=n.user_id ORDER BY n.id DESC LIMIT 10");
	  while ($row = $getNotities->fetch_assoc()) {
		  ?>
			<b><?php echo htmlspecialchars($row['name']); ?></b> - <em><?php echo $row['date']; ?> <?php if ($_SESSION['id'] == $row['id'] OR $_SESSION['role'] == "admin") { echo "<a href='?action=deleteanotitie&id=".$row['nid']."'>(verwijder)</a>"; } ?></em> <br>
			<?php echo htmlspecialchars($row['text']); ?>
			<hr>
		  <?php
	  }
	  ?>
	  <?php } ?>
	  <br>
	  <br>
	  <?php
	  if ($_SESSION['role'] != "anwb") {
	  ?>
	  De gemeente Dendam telt momenteel <?php echo $inw->num_rows; ?> inwoners<br>
	  <br>
	  De gemeente Dendam telt momenteel <?php echo $voe->num_rows; ?> geregistreerde voertuigen wat gemiddeld <?php echo round($voe->num_rows/$inw->num_rows,1); ?> per inwoner is<br>
	  <br>
	  De gemeente Dendam telt momenteel <?php echo $hvs->num_rows; ?> hulpverleners (politie/ambulance)<br>
	  <br>
	  Alle burgers beheren momenteel &euro;<?php echo number_format($monconr['tot'],2,",","."); ?> aan chartaal geld wat gemiddeld &euro;<?php echo number_format($monconr['tot']/$inw->num_rows,2,",","."); ?> per burger is<br>
	  <br>
	  Alle burgers beheren momenteel &euro;<?php echo number_format($monbanr['tot'],2,",","."); ?> aan giraal geld wat gemiddeld &euro;<?php echo number_format($monbanr['tot']/$inw->num_rows,2,",","."); ?> per burger is<br>
	  <br>
	  Momenteel zitten er <?php echo $gev->num_rows; ?>  mensen een gevangenisstraf uit<br>
	  <br>
	  Momenteel hebben de burgers totaal &euro;<?php echo number_format($openbr['tot'],2,",","."); ?>  aan boetes open staan<br>
	  <br>
	  Er zijn al <?php echo$logc->num_rows; ?> mensen opgezocht in MEOS.<br>
	  <?php } ?>
	  <hr>
	  <h1>Logboek</h1><br>
	  <div class="list-group">
	  <?php
		if ($_SESSION['role'] != "anwb") {
		  $sel = $con->query("SELECT DISTINCT burgerid,agent,burger FROM livelog ORDER BY id DESC LIMIT 6");
		  while ($row = $sel->fetch_assoc()) {
			  if (trim($row['agent']) != "") {
	  ?>
		<a href="gegevens.php?id=<?php echo $row['burgerid'] ?>" class="list-group-item">
		  <h4 class="list-group-item-heading"><?php echo $row['burger'] ?></h4>
		  <p class="list-group-item-text"><?php echo $row['agent'] ?> heeft <?php echo $row['burger']; ?> opgezocht.</p>
		</a>
	  <?php
	 }
	}
} else {
	echo "Geen toegang tot logboek";
}
	?>
	</div>
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
  

</body>

</html>
