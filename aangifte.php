<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=aangifte");
}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$insert = $con->query("INSERT INTO aangifte
	(
	aangever_voornaam,
	aangever_achternaam,
	aangever_geslacht,
	pleegplaats,
	pleegdatum,
	pleegtijd,
	verbalisant,
	verklaring
	)
	VALUES
	(
	'".$con->real_escape_string($_POST['aangever_voornaam'])."',
	'".$con->real_escape_string($_POST['aangever_achternaam'])."',
	'".$con->real_escape_string($_POST['aangever_geslacht'])."',
	'".$con->real_escape_string($_POST['pleegplaats'])."',
	'".$con->real_escape_string($_POST['pleegdatum'])."',
	'".$con->real_escape_string($_POST['pleegtijd'])."',
	'".$con->real_escape_string($_SESSION['name'])."',
	'".$con->real_escape_string($_POST['verklaring'])."'
	)");
	if ($insert) {
		Header("Location: aangiftes");
	} else {
		
	}
}
if (isset($_GET['id'])) {
	$get = $con->query("SELECT * FROM aangifte WHERE id='".$con->real_escape_string($_GET['id'])."'");
	$row = $get->fetch_assoc();
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
  <title>Dendam - <?php if (isset($_GET['id'])) { echo "Aangifte (".$_GET['id'].")"; } else { echo "Aangifte invoeren"; }?></title>
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
            <span class="nav-link-text">Basisadministratie</span>
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
            <span class="nav-link-text"><u>Aangifteadministratie</u></span>
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
        <?php if (!isset($_GET['id'])) { ?><li class="breadcrumb-item active">Aangifte invoeren</li> <?php } ?>
        <?php if (isset($_GET['id'])) { ?>
		<li class="breadcrumb-item"><a href="aangiftes">Aangifteadministratie</a></li>
		<li class="breadcrumb-item active">Aangifte (<?php echo $_GET['id']; ?>)</li> 
		<?php } ?>
      </ol>
		<form method="POST">
			<div class="col-sm-6"><em><b>Aangever voornaam</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="aangever_voornaam" class="form-control" placeholder="Voornaam aangever"  required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['aangever_voornaam']; ?>" readonly <?php } ?>></div>
			<div class="col-sm-6"><em><b>Aangever achternaam</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="aangever_achternaam" class="form-control" placeholder="Achternaam aangever" required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['aangever_achternaam']; ?>" readonly <?php } ?>></div>
			<div class="col-sm-6"><em><b>Aangever geslacht</b></em>:</div>
			<div class="col-sm-2"><input class="form-control" name="aangever_geslacht" required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['aangever_geslacht']; ?>" readonly <?php } ?>></div>
			<hr>
			<div class="col-sm-6"><em><b>Pleegplaats</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="pleegplaats" class="form-control" placeholder="Pleegplaats" required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['pleegplaats']; ?>" readonly <?php } ?>></div>
			<div class="col-sm-6"><em><b>Pleegdatum</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="pleegdatum" class="form-control" placeholder="Pleegdatum" required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['pleegdatum']; ?>" readonly <?php } ?>></div>
			<div class="col-sm-6"><em><b>Pleegtijd</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="pleegtijd" class="form-control" placeholder="Pleegtijd" required <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['pleegtijd']; ?>" readonly <?php } ?>></div>
			<hr>
			<div class="col-sm-6"><em><b>Verbalisant</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="verbalisant" class="form-control" value="<?php if (isset($_GET['id'])) { echo $row['verbalisant']; } else { echo $_SESSION['name']; } ?>" readonly required></div>
			<hr>
			<div class="col-sm-6"><em><b>Verklaring</b></em>:</div>
			<div class="col-sm-6"><textarea name="verklaring" rows="10" class="form-control" <?php
if (!isset($_GET['id'])) 
{ 
?>
placeholder="Voer de verklaring woordelijk in, de rechercheur moet precies kunnen nalezen hoe de situatie exact ging volgens de aangever"
<?php
}
?>  required <?php if (isset($_GET['id'])) { ?> readonly <?php } ?>>
			<?php if (isset($_GET['id'])) { echo $row['verklaring']; } ?></textarea></div>
			
			<hr>
			<?php 
			if (isset($_GET['id'])) {
			?>
			<div class="col-sm-6"><em><b>Opnamedatum</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="opnamedatum" class="form-control" placeholder="Opnamedatum" <?php if (isset($_GET['id'])) { ?>  value="<?php echo $row['opnamedatum']; ?>" readonly <?php } ?> required <?php if (isset($_GET['id'])) { ?> readonly <?php } ?>></div>
			<div class="col-sm-6"><em><b>Status</b></em>:</div>
			<div class="col-sm-6"><input type="text" name="status" class="form-control" placeholder="Status" <?php if (isset($_GET['id'])) { ?>  value="<?php if ($row['status'] == "open") { echo "Geopend"; } if ($row['status'] == "closed") { echo "Gesloten"; } if ($row['status'] == "hold") { echo "In de wacht"; } ?>" readonly <?php } ?> required <?php if (isset($_GET['id'])) { ?> readonly <?php } ?>></div><br>
			<div class="col-sm-6"><a class="btn btn-primary btn-block" target="_blank" href="aangifteafschrift?id=<?php echo $_GET['id']; ?>">Afschrift openen</a></div><br>
			<?php
			} else {
			?>
			<input type="hidden" name="x-form" value="aangifte">
			<div class="col-sm-6"><input type="submit" value="Aangifte invoeren" class="btn btn-success btn-block"></div>
			<?php
			}
			?>
		</form>
		<?php
		if (isset($_GET['id'])) {
		?>
		
		<hr>
		<h2>Reactie plaatsen</h2>
		<form method="post" action="reageeropaangifte.php">
		<em>Auteur:</em><br>
		<input type="text" class="form-control" name="author" value="<?php echo $_SESSION['name']; ?>" readonly><br>
		<em>Reactie:</em><br>
		<textarea name="reactie" cols="10" rows="5" class="form-control"></textarea>
		<input type="hidden" name="aangifte" value="<?php echo $_GET['id']; ?>">
		<input type="submit" value="Opslaan" class="btn btn-success btn-block">
		</form>
		<hr>
		<h2>Reacties</h2><hr>
		
		<?php
		
			$reacties = $con->query("SELECT * FROM aangifte_reacties WHERE aangifte = '".$con->real_escape_string($_GET['id'])."' ORDER BY datetime DESC");
			while ($row = $reacties->fetch_assoc()) {
			?>
			<h3><?php echo $row['author']; ?></h3>
			<?php echo $row['datetime']; ?><br>
			<?php echo nl2br(htmlspecialchars($row['reactie'])); ?><hr><br>
			<?php 
			}
			?>
		
		
		<?php
		}
		?>
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
