<?php 

use Models\Action;

session_start();

include('../inc/mysql.inc.php');

$cognome = $_GET['cognome'];
$cliente = $_GET['barcode'];
$data = $_GET['data'];

$content = '';

//$sql = "SELECT id, premio, ritirato FROM ".DB_NAME.".".newgiocata." WHERE `cliente` = '$cliente' AND risultato = 'VINTO' AND DATE(timestamp) = DATE('$data') ORDER BY premio";
$sql = "SELECT id, premio, ritirato FROM ".DB_NAME.".".newgiocata." WHERE `cliente` = '$cliente' AND risultato = 'VINTO' AND ritirato = 'F' ORDER BY premio";
$result=mysqli_query($dbc, $sql);
while ($obj=mysqli_fetch_object($result))
{
	$id = $obj->id;
	$premio = $obj->premio;
	$ritirato = $obj->ritirato;
	if ($premio)
	{
		if ($ritirato == 'T') 		{$premiRitirati 	.= "- <b>$premio</b><br>"; }
		elseif ($ritirato == 'F')	{$premi 			.= "- <b>$premio</b><br>"; $vinto = true;}
		
		mysqli_query($dbc,"UPDATE ".DB_NAME.".".newgiocata." SET `ritirato`='T', ritiro='".DATE('Y-m-d H:i:s')."' WHERE `id` = $id");
	}
}
if ($vinto)
{
	$data = date('d/m/Y');
	$ora = date('H:i:s');
	if (!isset($premi))	$premi = '-';
	if (!isset($premiRitirati))	$premiRitirati = '-';
	/*$ricevuta = 
	"
	<img style='margin-bottom:10px;' src='images/ricevuta.jpg' />
	<div width='100%' align='left' style='font-size:80%;'>
	RICEVUTA EMESSA DA :<BR>
	WORLD EVENT SRL<BR>
	VIA BIONAZ 40/9<BR>
	10142 TORINO<BR>
	P.IVA /C.F. 09568100011<BR>
	EX IVA ART. 2 LETT. A COMMA 3
	</div>
	<br><div width='100%' align='center'>Il cod. cliente<br><b>$cliente</b></div> 
	Vince:
	<br>$premi
	<br>
	<br><div width='100%' align='center' style='border-top:1px solid black;'>Firma per ritiro</div>
	<br><table align='right' border='0'><tr><td align='center'>Data</td><td align='center'>Ora</td></tr><tr><td>$data</td><td>$ora</td></tr></table>
	";
	echo utf8_encode(str_replace("�", "&euro;", "
		<html>
			<head>
				<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
				<title></title>
			</head>
			<body>
				$ricevuta
				<br><br><br><br><br><div width='100%' style='border-bottom:1px dotted black;'></div><br><br>
				$ricevuta
			</body>
		</html>
	"));*/
}


?>