<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login.php?returnpage=users");
}
if ($_SESSION['role'] != "admin") {
	Header("Location:index.php");
}

if (@$_GET['action'] == "delete") {
	$con->query("DELETE FROM users WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	Header("Location: gebruikers");
}
if (@$_GET['action'] == "ww") {
	$con->query("UPDATE users SET password='".password_hash($con->real_escape_string($_GET['password']),PASSWORD_BCRYPT)."' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	Header("Location: gebruikers");
}
if (@$_GET['action'] == "status") {
	$statusq = $con->query("SELECT status FROM users WHERE id='".$con->real_escape_string($_GET['id'])."' LIMIT 1");
	$status = $statusq->fetch_assoc();
	if ($status['status'] == "active") {
		$con->query("UPDATE users SET status='inactive' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($status['status'] == "inactive") {
		$con->query("UPDATE users SET status='active' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	Header("Location: gebruikers");
}
if (@$_GET['action'] == "promotie") {
	$rangq = $con->query("SELECT rang FROM users WHERE id='".$con->real_escape_string($_GET['id'])."' LIMIT 1");
	$rang = $rangq->fetch_assoc();
	if ($rang['rang'] == "G4S") {
		$con->query("UPDATE users SET rang='Aspirant' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Aspirant") {
		$con->query("UPDATE users SET rang='Surveillant' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Surveillant") {
		$con->query("UPDATE users SET rang='Agent' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Agent") {
		$con->query("UPDATE users SET rang='Hoofd Agent' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Agent") {
		$con->query("UPDATE users SET rang='Brigadier' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Brigadier") {
		$con->query("UPDATE users SET rang='Inspecteur' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Inspecteur") {
		$con->query("UPDATE users SET rang='Hoofd Inspecteur' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Inspecteur") {
		$con->query("UPDATE users SET rang='Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Commissaris") {
		$con->query("UPDATE users SET rang='Hoofd Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Commissaris") {
		$con->query("UPDATE users SET rang='1e Hoofd Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "1e Hoofd Commissaris") {
		$con->query("UPDATE users SET rang='1e Hoofd Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	Header("Location: gebruikers");
}

if (@$_GET['action'] == "degradatie") {
	$rangq = $con->query("SELECT rang FROM users WHERE id='".$con->real_escape_string($_GET['id'])."' LIMIT 1");
	$rang = $rangq->fetch_assoc();
	if ($rang['rang'] == "G4S") {
		$con->query("UPDATE users SET rang='G4S' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Aspirant") {
		$con->query("UPDATE users SET rang='G4S' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Surveillant") {
		$con->query("UPDATE users SET rang='Aspirant' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Agent") {
		$con->query("UPDATE users SET rang='Surveillant' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Agent") {
		$con->query("UPDATE users SET rang='Agent' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Brigadier") {
		$con->query("UPDATE users SET rang='Hoofd Agent' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Inspecteur") {
		$con->query("UPDATE users SET rang='Brigadier' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Inspecteur") {
		$con->query("UPDATE users SET rang='Inspecteur' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Commissaris") {
		$con->query("UPDATE users SET rang='Hoofd Inspecteur' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "Hoofd Commissaris") {
		$con->query("UPDATE users SET rang='Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	if ($rang['rang'] == "1e Hoofd Commissaris") {
		$con->query("UPDATE users SET rang='Hoofd Commissaris' WHERE id = '".$con->real_escape_string($_GET['id'])."'");
	}
	Header("Location: gebruikers");
}

if (@$_GET['action'] == "delspec") {
	
	$user = $_GET['user'];
	$spec = $_GET['spec'];
	
	//First, get every spec from DB
	$userSpecs = $con->query("SELECT specialisaties FROM users WHERE id = '".$user."'");
	
	//Second, place them in $row and make them an array
	$userSpecsRow = $userSpecs->fetch_assoc();
	$userSpecs = explode(", ", $userSpecsRow['specialisaties']);
	
	//Third, remove the $spec from the array and implode it again
	unset($userSpecs[array_search($spec, $userSpecs)]);
	$userSpecs = implode(", ",$userSpecs);
	
	//var_dump($userSpecs);
	
	//Fourth, update user with the new specs
	$con->query("UPDATE users SET specialisaties = '".$userSpecs."' WHERE id = '".$user."'");
	
	//echo $con->error;
	
	//exit;
	
	$userName = $con->query("SELECT username, name FROM users WHERE id = '".$user."'");
	$userRow = $userName->fetch_assoc();
	
	$message = "".$userRow['name']." (".$userRow['username'].") heeft de specialisatie ".$spec." verloren\n\n";
	
	$data = array("username" => "Trainingen en specialisaties", "content" => $message);
	$data_string = json_encode($data);

	$ch = curl_init('https://discordapp.com/api/webhooks/502020313748340747/WEbxzliFgq3yo3lfxDXYEscl0bIVn4zaM9tyvMKmL1xE2tPH6JYXHwAm48_GSl0_FNnT');
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
	curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array(
		'Content-Type: application/json',
		'Content-Length: ' . strlen($data_string))
	);
	
		$result = curl_exec($ch);

	Header("Location: gebruikers");
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
	if (trim($_POST['username']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	if (trim($_POST['password']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	if (trim($_POST['status']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	if (trim($_POST['rol']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	if (trim($_POST['rang']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	if (trim($_POST['name']) == NULL) {
		Header("Location: gebruikers");
		exit;
	}
	
	$add = $con->query("INSERT INTO users 
	(
	username,
	password,
	status,
	role,
	rang, 
	name
	)
	VALUES 
	(
	'".$con->real_escape_string($_POST['username'])."',
	'".password_hash($con->real_escape_string($_POST['password']),PASSWORD_BCRYPT)."',
	'".$con->real_escape_string($_POST['status'])."',
	'".$con->real_escape_string($_POST['rol'])."',
	'".$con->real_escape_string($_POST['rang'])."',
	'".$con->real_escape_string($_POST['name'])."'
	)");
}

$mensenq = $con->query("SELECT * FROM users ORDER BY status DESC");
$newpass = rand(11111111,99999999);
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Dendam - Gebruikers</title>
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
            <span class="nav-link-text">Aangifteadministratie</span>
          </a>
        </li>
		<?php if ($_SESSION['role'] == "admin") { ?>
		<li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="gebruikers">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text"><u>Gebruikersadministratie</u></span>
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
        <li class="breadcrumb-item active">Gebruikers</li>
      </ol>
		<form method="POST">
		<b><em>Gebruikersnaam:</em></b><br>
		<input type="text" name="username" class="form-control"><br>
		<b><em>Wachtwoord:</em></b><br>
		<input type="password" name="password" class="form-control"><br>
		<b><em>Status:</em></b><br>
		<select name="status" class="form-control">
		<option value="active">Actief</option>
		<option value="inactive">Inactief</option>
		</select><br>
		<b><em>Rol:</em></b><br>
		<select name="rol" class="form-control">
		<option value="user">Gebruiker</option>
		<option value="om">Openbaar Ministerie</option>
		<option value="anwb">ANWB</option>
		<option value="admin">Beheerder</option>
		</select><br>
		<b><em>Rang:</em></b><br>
		<select name="rang" class="form-control">
		<option value="G4S">G4S</option>
		<option value="Aspirant" selected>Aspirant</option>
		<option value="Surveillant">Surveillant</option>
		<option value="Agent">Agent</option>
		<option value="Hoofd Agent">Hoofd Agent</option>
		<option value="Brigadier">Brigadier</option>
		<option value="Inspecteur">Inspecteur</option>
		<option value="Hoofd Inspecteur">Hoofd Inspecteur</option>
		<option value="Commissaris">Commissaris</option>
		<option value="Hoofd Commissaris">Hoofd Commissaris</option>
		<option value="1e Hoofd Commissaris">1e Hoofd Commissaris</option>
		</select><br>
		<b><em>Naam:</em></b><br>
		<input type="text" name="name" class="form-control" placeholder="M. Rutte"><br>
		<input type="submit" value="Account aanmaken" class="btn btn-success btn-block">
		</form>
		<hr>
		<table id="badm" class="table">
		  <tr>
			<th>ID</th>
			<th>Gebruikersnaam</th>
			<th>Status</th> 
			<th>Rol</th>
			<th>Rang</th>
			<th>Naam</th>
			<th>Laatst online</th>
			<th>Specialisaties</th>
			<th>Actie</th>
		  </tr>
		  <?php
		  while ($row = $mensenq->fetch_assoc()) { 
			$specialisaties = explode(", ",$row['specialisaties']);
			$user = $row['id'];
		  ?>
		  <tr>
			<td><?php echo $row['id']; ?></td>
			<td><?php echo htmlspecialchars($row['username']); ?></td>
			<td><?php if($row['status'] == "active") {echo "Geactiveerd";} else {echo "Gedeactiveerd";}?></td> 
			<td><?php echo $row['role']; ?></td>
			<td><?php echo htmlspecialchars($row['rang']); ?></td>
			<td><?php echo htmlspecialchars($row['name']); ?></td>
			<td><?php echo htmlspecialchars($row['last_login']); ?></td>
			<td><?php foreach($specialisaties as $a) { echo "<a title='Let je wel op? Hiermee verwijder je een specalisatie' href=?action=delspec&user=$user&spec=$a>$a</a>&nbsp;"; } ?></td>
			<td><?php if ($row['id'] != 1) { ?><a onclick="alert('Nieuw wachtwoord: <?php echo $newpass; ?>')" href="?action=ww&id=<?php echo $row['id']; ?>&password=<?php echo $newpass; ?>">Nieuw wachtwoord</a>&nbsp;<a href="?action=promotie&id=<?php echo $row['id']; ?>">Promotie</a>&nbsp;<a href="?action=degradatie&id=<?php echo $row['id']; ?>">Degradatie</a>&nbsp;<a href="?action=status&id=<?php echo $row['id']; ?>">Activeer/Deactiveer</a><?php } ?></td>
		  </tr>
		  <?php 
		  /*
		  <a href="?action=delete&id=<?php echo $row['id']; ?>">Verwijderen</a>&nbsp;
		  */
		  }
		  ?>
		</table>
	
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
