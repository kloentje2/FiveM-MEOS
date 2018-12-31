<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=index");
}

if ($_SESSION['rang'] == "G4S") {
	Header("Location: index");
}

if (isset($_GET['kenteken'])) {
	//$a = $ddcon->query("SELECT * FROM owned_vehicles INNER JOIN users ON users.identifier = owned_vehicles.owner WHERE vehicle LIKE '%".$_GET['kenteken']."%' LIMIT 1");
	$a = $ddcon->query("SELECT * FROM owned_vehicles INNER JOIN users ON users.identifier = owned_vehicles.owner WHERE plate = '".$_GET['kenteken']."' LIMIT 1");
	$r = $a->fetch_assoc();
	
	$s = $con->query("SELECT id FROM rdwwok WHERE voertuigid = '".$r['id']."'");
	
	if ($s->num_rows == 1) {
		$status = "Afgekeurd";
	} else {
		$status = "Goedgekeurd";
	}
}

if (@$_GET['actie'] == "afkeuren") {
	$i = $con->query("INSERT INTO rdwwok (voertuigid) VALUES ('".$_GET['id']."')");
	$log = $con->query("INSERT INTO rdwlog (user,voertuigid,action,ip) VALUES ('".$_SESSION['id']."','".$_GET['id']."','afkeuren','".$_SERVER['REMOTE_ADDR']."')");
	Header("Location:rdw?kenteken=".$_GET['kenteken']);
}
if (@$_GET['actie'] == "goedkeuren") {
	$i = $con->query("DELETE FROM rdwwok WHERE voertuigid = '".$_GET['id']."'");
	$log = $con->query("INSERT INTO rdwlog (user,voertuigid,action,ip) VALUES ('".$_SESSION['id']."','".$_GET['id']."','goedkeuren','".$_SERVER['REMOTE_ADDR']."')");
	Header("Location:rdw?kenteken=".$_GET['kenteken']);
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
  <title>Dendam - Voertuigregistratie</title>
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
<style>
#up {
    text-transform: uppercase;
}
</style>
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
		<?php if ($_SESSION['role'] != "anwb") { ?>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="basisadministratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Basisadministratie</span>
          </a>
        </li>
		<?php }
		?>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="voertuigregistratie">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text"><u>Voertuigregistratie</u></span>
          </a>
        </li>
		<?php if ($_SESSION['role'] != "anwb") { ?>
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
		<li class="breadcrumb-item">
   		  <a href="voertuigregistratie">Voertuigregistratie</a>
		</li>
        <li class="breadcrumb-item active">RDW</li>
      </ol>
<?php
if (@$_GET['no'] == "no") {
	echo "<h1 style='color:red'>Kenteken niet gevonden</h1>";
}
?>
		<em><b>Zoek een voertuigeigenaar op kenteken</b></em><br>
		<form method="get">
		<input type="text" id="up" class="form-control" name="kenteken" placeholder="28VDO163" required><br>
		<input type="submit" class="btn btn-success btn-block" value="Zoek voertuig">
		</form>
		
		<?php
		if (isset($_GET['kenteken'])) {
			
		
		?>
		<hr>
		<form>
			Eigenaar:<br><input class="form-control" type="text" value="<?php echo $r['firstname']." ".$r['lastname']; ?>" readonly><br>
			Kenteken:<br><input class="form-control" type="text" value="<?php echo $_GET['kenteken']; ?>" readonly><br>
			Status:<br><input class="form-control" type="text" value="<?php echo $status; ?>" readonly><br>
			<h3>Wegwaardige status:</h3>
			<?php 
			if ($status == "Goedgekeurd") { ?>
			<a href="?actie=afkeuren&id=<?php echo $r['id']; ?>&kenteken=<?php echo $_GET['kenteken']; ?>" class="btn btn-danger"><h3>Voertuig afkeuren</h3></a>
			<?php } else { ?>
			<a href="?actie=goedkeuren&id=<?php echo $r['id']; ?>&kenteken=<?php echo $_GET['kenteken']; ?>" class="btn btn-success"><h3>Voertuig goedkeuren</h3></a>
			<?php 
		} ?>
		</form>
		
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
