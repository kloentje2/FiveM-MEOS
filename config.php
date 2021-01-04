<?php
ini_set("session.hash_function","sha512");
session_start();

ini_set("max_execution_time",500);

$db_host = "localhost";
$db_user = "meos_username";
$db_pass = "";
$db_data = "meos_database";

$con = new mysqli($db_host,$db_user,$db_pass,$db_data);

$dd = array(
"host" => "localhost",
"user" => "fivem_username",
"pass" => "",
"data" => "fivem_database"
);

$ddcon = new mysqli($dd['host'],$dd['user'],$dd['pass'],$dd['data']);

$ddg = array(
"host" => "localhost",
"user" => "gms_username",
"pass" => "",
"data" => "gms_database"
);

$gms = new mysqli($ddg['host'],$ddg['user'],$ddg['pass'],$ddg['data']);

require "GoogleAuthenticator.php";
$ga = new PHPGangsta_GoogleAuthenticator();

$browser_color = "#004682";

if (isset($_SESSION['id'])) {
	$q = $con->query("SELECT status FROM users WHERE id = '".$_SESSION['id']."' AND status = 'active'");
	if ($q->num_rows == 0) {
		Header("Location: exit.php");
	}
}

//Working Around 2FA bug.

	$q = $con->query("SELECT username, cjib FROM users WHERE id = '".$_SESSION['id']."'");
	$r = $q->fetch_assoc();
	$_SESSION['username'] = $r['username'];
	$_SESSION['cjib'] = $r['cjib'];


if (isset($_POST)) {
	$a = $_POST;
	if (isset($a['password'])) {
		$a['password'] = NULL;
	}
}

//Log
$data = 
array(
"SERVER"=>$_SERVER,
"SESSION"=>$_SESSION,
"POST"=>$a,
"GET"=>$_GET
);
$con->query("INSERT INTO pagevisitlog (
uri,
ip,
_SERVER,
_SESSION,
_POST,
_GET) 
VALUES
(
'".$_SERVER['REQUEST_URI']."',
'".$_SERVER['REMOTE_ADDR']."',
'".json_encode($data['SERVER'])."',
'".json_encode($data['SESSION'])."',
'".json_encode($data['POST'])."',
'".json_encode($data['GET'])."'
)");
$curl = curl_init();

curl_setopt($curl,CURLOPT_URL,"https://meos.Leiderdamrp.nl/indexveh.php");
curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
curl_setopt($curl,CURLOPT_HEADER, false); 
curl_setopt($curl,CURLOPT_HEADER, false); 
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
?>
