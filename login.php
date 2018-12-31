<?php
require "config.php";
if (isset($_GET['returnpage'])) {
	$_SESSION['returnpage'] = $_GET['returnpage'];
	Header("Location: login");
}
if ($_SERVER['REQUEST_METHOD'] == "POST" AND $_POST['form'] == "login") {
	if (trim($_POST['username']) == NULL) {
		Header("Location:login?error");
	}
	if (trim($_POST['password']) == NULL) {
		Header("Location:login?error");
	}
	
	$query = $con->query("SELECT id,password,role,name,role,rang,2fa FROM users WHERE username = '".$con->real_escape_string($_POST['username'])."' AND status = 'active'");
	
	if ($query->num_rows == 1) {
		$row = $query->fetch_assoc();
		if (password_verify($_POST['password'],$row['password'])) {
			$_SESSION['loggedin'] = true;
			$_SESSION['username'] = $_POST['username'];
			$_SESSION['role'] = $row['role'];
			$_SESSION['name'] = $row['name'];
			$_SESSION['rang'] = $row['rang'];
			$_SESSION['id'] = $row['id'];
			
			if ($row['2fa'] != NULL) {
				$_SESSION['id'] = $row['id'];
				$_SESSION['username'] = $row['username'];
				Header("Location:login.php?2fa");
				exit;
			}	
			
			
			$con->query("UPDATE users SET last_login = '".date('d-m-Y')."' WHERE id = '".$row['id']."'");
			
			if ($_SERVER['HTTP_REFFER'] != "") {
				header('Location: ' . $_SERVER['HTTP_REFERER']);
			} else {
				if (isset($_SESSION['returnpage'])) {
			Header("Location: ".$_SESSION['returnpage']);
		} else {
			Header("Location: index");
		}
			}
		} else {
			//Wachtwoord klopt niet
			Header("Location: login?error");
		}
	} else {
		Header("Location: login?error");
	}
	
}
if ($_SERVER['REQUEST_METHOD'] == "POST"  AND $_POST['form'] == "2fa") {
	$get = $con->query("SELECT 2fa FROM users WHERE id = '".$_SESSION['id']."'");
	$row = $get->fetch_assoc();
	$oneCode = $_POST['2fa'];
	//echo "Checking Code '$oneCode' and Secret '$secret':\n";

	$checkResult = $ga->verifyCode($row['2fa'], $oneCode, 2);    // 2 = 2*30sec clock tolerance
	if ($checkResult) {
		$query = $con->query("SELECT id,password,role,name,role,rang,2fa FROM users WHERE id = '".$con->real_escape_string($_SESSION['id'])."' AND status = 'active'");
		$row2 = $query->fetch_assoc();
		$_SESSION['2fa'] = TRUE;
		$_SESSION['loggedin'] = true;
		$_SESSION['username'] = $_POST['username'];
		$_SESSION['role'] = $row2['role'];
		$_SESSION['name'] = $row2['name'];
		$_SESSION['rang'] = $row2['rang'];
		$_SESSION['id'] = $row2['id'];
		if (isset($_SESSION['returnpage'])) {
			Header("Location: ".$_SESSION['returnpage']);
		} else {
			Header("Location: index");
		}
	} else {
		Header("Location: ?result=2fafail");
	}
	exit;
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
  <title>Dendam - Inloggen</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <meta name="theme-color" content="<?php echo $browser_color; ?>">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login<div class="pull-right"><!--<a href="#" data-toggle="modal" data-target="#exampleModal">Disclaimer</a>--></div></div>
      <div class="card-body">
	  <!--<img height="110" src="img/politiedd.svg"><br><br>-->
        <form method="POST">
		<input type="hidden" name="form" value="<?php if (isset($_GET['2fa'])) { echo '2fa'; } else { echo 'login'; } ?>">
          <div class="form-group">
            <label for="exampleInputEmail1">Gebruikersnaam: </label>
            <input class="form-control" id="exampleInputEmail1" type="text" name="username" aria-describedby="emailHelp" placeholder="Gebruikersnaam" <?php if (isset($_GET['2fa'])) { echo "disabled"; }  ?>>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Wachtwoord: </label>
            <input class="form-control" id="exampleInputPassword1" type="password" name="password" placeholder="Wachtwoord" <?php if (isset($_GET['2fa'])) { echo "disabled"; } ?>>
          </div>
          <div class="form-group">
          </div>
		  <input type="submit" value="Login" class="btn btn-primary btn-block">
		  <?php if (isset($_GET['2fa'])) { ?>
		  <div class="form-group">
            <label for="exampleInputPassword1">2FA toegangscode: </label>
            <input class="form-control" id="exampleInputPassword1" type="text" name="2fa" pattern="[^' ']+" placeholder="252987" autofocus>
          </div>
		  <?php } ?>
        </form>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Disclaimer</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Politie Dendam, Dendam of Dendam RP is op <b>geen enkele manier</b> gelieerd aan Politie Nederland, een van haar dochterorganisaties of partners. De gegevens die in dit systeem zijn opgeslagen zijn volledig fictief en uitsluitend voor spelgerelateerd gebruik. Rechten voor het logogebruik van de politie zijn voorbehouden aan Politie Nederland en de door haar aangewezen organisaties of personen. Alle overige rechten zijn allen voorbehouden aan Dendam RP, geregistreerd bij de Kamer van Koophandel onder registratienummer 63239523</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Sluiten</button>
      </div>
    </div>
  </div>
</div>
</html>
