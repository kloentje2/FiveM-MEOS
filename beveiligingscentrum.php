<?php
require "config.php";
if ($_SESSION['loggedin'] != TRUE) {
	Header("Location: login?returnpage=beveiligingscentrum");
}
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	if ($_POST['form'] == "2fa") {
		//$oneCode = $ga->getCode($_POST['secret']);
		$oneCode = $_POST['code'];
		//echo "Checking Code '$oneCode' and Secret '$secret':\n";

		$checkResult = $ga->verifyCode($_POST['secret'], $oneCode, 2);    // 2 = 2*30sec clock tolerance
		if ($checkResult) {
			$enable2FA = $con->query("UPDATE users SET 2fa = '".$_POST['secret']."' WHERE id = '".$_SESSION['id']."'");
			$_SESSION['2fa'] = TRUE;
			Header("Location: beveiligingscentrum?result=2faok");
		} else {
			Header("Location: beveiligingscentrum?result=2fafail");
		}
		exit;
	}
	if ($_POST['form'] == "password") {
		//password = current
		//password1 = new password field 1
		//password2 = new password field 2
		
		if (trim($_POST['password']) == "" OR trim($_POST['password1']) == "" OR trim($_POST['password2']) == "") {
			Header("Location: beveiligingscentrum?emp");
			exit;
		}
		
		if (trim($_POST['password1']) != $_POST['password2']) {
			Header("Location: beveiligingscentrum?p12");
			exit;
		}
		
		$getPasswordq = $con->query("SELECT password FROM users WHERE id = '".$_SESSION['id']."'");
		$getPassword = $getPasswordq->fetch_assoc();
		
		if (password_verify($_POST['password'],$getPassword['password'])) {
			$password = $con->real_escape_string(password_hash($_POST['password1'],PASSWORD_BCRYPT));
			$updatePassword = $con->query("UPDATE users SET password = '".$password."' WHERE id = '".$_SESSION['id']."'");
			//exit($con->error);
			session_destroy();
			Header("Location: login");
			exit;
		} else {
			Header("Location: beveiligingscentrum?cur");
		}
		
	}
}
if (isset($_GET['action']) AND $_GET['action'] == "gms") {
	//Generate salt
	$salt = uniqid();
	$update = $con->query("UPDATE users SET salt = '".$salt."' WHERE id = '".$_SESSION['id']."'");
	
	//Generate meos_secret
	$sel = $con->query("SELECT salt,id,username FROM users WHERE id = '".$_SESSION['id']."'");
	$row = $sel->fetch_assoc();
	
	
	$meos_secret = sha1($row['salt'].$row['id'].$row['username']);
	$done = false;
	if ($done == false) {
	$gms->query("INSERT INTO users 
	(
	username,
	meos_secret,
	email
	) VALUES (
	'meos_".$row['username']."',
	'".$meos_secret."',
	username
	)");
	}
	$done = true;
	Header("Location: beveiligingscentrum");
	exit;
}
$actions = $con->query("SELECT burger,burgerid,datetime FROM livelog WHERE agent = '".$con->real_escape_string($_SESSION['name'])."' ORDER BY id DESC LIMIT 50");
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
  <link rel="icon" type="image/png" href="favicon.ico" />
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
          <a class="nav-link" href="index">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text"><u>Dashboard</u></span>
          </a>
        </li>
		<?php if ($_SESSION['role'] != "anwb") { ?>
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
		<li class="breadcrumb-item active">
         Beveiligingscentrum
        </li>
        
      </ol>
		<div>
		Acccountbeveiligingscentrum van <?php echo $_SESSION['name'];?><hr>
		<h3>Wachtwoord wijzigen</h3>
		<form method = "POST">
			<input type="hidden" name="form" value="password">
			<em>Huidig wachtwoord:</em>
			<input type="password" class="form-control" name="password">
			<em>Nieuw wachtwoord:</em>
			<input type="password" class="form-control" name="password1">
			<em>Herhaal nieuw wachtwoord:</em>
			<input type="password" class="form-control" name="password2">
			<input type="submit" value="Wachtwoord wijzigen" class="btn btn-primary">
		</form>
		<hr>
		<?php if (@$_SESSION['2fa'] != TRUE) { ?>
		<h3>2 Factor Authenticaction / Tweewegs authenticatie</h3>
		<em><a href="#" onclick="event.preventDefault();alert('Scan de onderstaande code met een 2FA app, zoals de Google Authenticator en voer de code in die je krijgt. Vanaf het moment dat je dit inschakelt moet je altijd inloggen met de 2FA app die jou een code geeft.')">Wat is dit?</a></em><br>
		<?php
		$secret = $ga->createSecret();
		$qrCodeUrl = $ga->getQRCodeGoogleUrl('Dendam MEOS', $secret);

		?>
		Geheime code: <?php echo $secret; ?><br>
		QR Code:<br>
		<img src="<?php echo $qrCodeUrl; ?>">
		<form method="POST">
			<em>Authenticatiecode:</em>
			<input type="text" name="code" pattern="[^' ']+" placeholder="252987" class="form-control">
			<input type="hidden" name="secret" value="<?php echo $secret; ?>">
			<input type="hidden" name="form" value="2fa">
			<input type="submit" value="2FA Inschakelen" class="btn btn-primary">
		</form>
		<?php
		} else {
		?>
		<h3>2 Factor Authenticaction / Tweewegs authenticatie</h3>
		2 Factor Authenticaction / Tweewegs authenticatie is momenteel ingeschakeld. Contacteer je leidinggevende als je dit wilt uitschakelen.
		<?php 
		}
		?>
		</div>
		<hr><br>
		<?php if (true) { ?>
		<h1>Koppel GMS</h1>
		<?php
		$check = $con->query("SELECT salt FROM users WHERE id = '".$_SESSION['id']."'");
		$row = $check->fetch_assoc();
		if ($row['salt'] == "") {
		?>
		<a class="btn btn-primary" href="?action=gms">Koppel GMS</a><br>
		<?php } else { ?>
		<a class="btn btn-secondary" style="cursor: not-allowed;" href="#">Reeds gekoppeld aan GMS</a><br>
		<?php } ?>
		Bovenstaande knop koppelt GMS voor jouw MEOS account. Het genereert een unieke code i.c.m. een zogenaamde salt.
		<hr><br>
		<h1>Logboek</h1>
		<table class="table">
		  <thead>
			<tr>
			  <th scope="col">Patiënt</th>
			  <th scope="col">Registratiemoment</th>
			</tr>
		  </thead>
		  <tbody>
			<?php
			while($row = $actions->fetch_assoc()) {
			?>
			<tr>
			  <td><a href="https://meos.dendamrp.nl/gegevens?id=<?php echo $row['burgerid']; ?>"><?php echo $row['burger']; ?></a></td>
			  <td><?php echo $row['datetime']; ?></td>
			</tr>
			<?php } ?>
		  </tbody>
		</table>
		<?php } ?>
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
