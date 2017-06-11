<?php

use Models\Action;

session_start();

include('../inc/mysql.inc.php');

header('Content-type: text/html; charset=utf-8');
$today = date('Y-m-d');
mysqli_set_charset('utf8');
$sql = "SELECT cliente, premio, timestamp as data, ritirato FROM ".DB_NAME.".".newgiocata." WHERE  `risultato` = 'VINTO' AND ritirato = 'F' ORDER BY DATE('{$today}')"; 

$result=mysqli_query($dbc,$sql);

while ($obj=mysqli_fetch_object($result))
{
	$cliente 	= $obj->cliente;
	$premio 	= $obj->premio;
	$data 		= $obj->data;
	$ritirato 	= $obj->ritirato;
	
	$table .=
	"
	<tr>
		<td>$cliente</td>
		<td>$premio</td>
		<td>$data</td>
		<td>No</td>
	</tr>
	";
	
}
$table .= '<td colspan=4>-</tr>';

$sql = "SELECT cliente, premio, timestamp as data, ritirato FROM ".DB_NAME.".".newgiocata." WHERE  `risultato` = 'VINTO' AND DATE(timestamp) = DATE('$today') ORDER BY data DESC"; 
$result=mysqli_query($dbc,$sql) ;
while ($obj=mysqli_fetch_object($result))
{
	$cliente 	= $obj->cliente;
	$premio 	= $obj->premio;
	$data 		= substr($obj->data,-8);
	$ritirato 	= $obj->ritirato;
	
	if ($ritirato == 'T') $ritirato = 'Si'; else $ritirato = 'No';
	$table2 .=
	"
	<tr>
		<td>$cliente</td>
		<td>$premio</td>
		<td>$data</td>
		<td>$ritirato</td>
	</tr>
	";
	
}
$table2 .= '<td colspan=4>-</tr>';



$sql = 'SELECT nome, tot, usciti FROM '.DB_NAME.'.'.newpremi.' WHERE data = \''.date('Y-m-d').'\'';
$result=mysqli_query($dbc, $sql);
$totUsciti = 0; $totTot = 0; $totRimanenti = 0;
while ($obj=mysqli_fetch_object($result))
{
	$nome = $obj->nome;
	$usciti = $obj->usciti;
	$tot = $obj->tot;
	$rimanenti = $tot-$usciti;
	
	$premi .= "<tr><td>$nome</td><td>$tot</td><td>$usciti</td><td>$rimanenti</td></tr>";
	$totUsciti+=$usciti; $totTot+=$tot; $totRimanenti+=$rimanenti;
}
$premi .= "<tr>
				<td><strong>TOTALE</strong></td>
				<td>$totTot</td>
				<td>$totUsciti</td>
				<td>$totRimanenti</td>
			</tr>";

$premi .= '<td colspan=4>-</tr>';

header("Refresh:1");
?>

<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="refresh" content="5">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<style>
		*{font-size: 100%;}
		html,body{background-color:#fff; margin:0; padding:0;}
		table{float:left;margin:15px; background-color:#fff;}
		table,td,th{border-collapse:collapse; border:1px solid black;padding:10px;text-align:center;}
		th{background-color:#ccc;}
		tr:last-child{background-color:#eee;}
	</style>
</head>
<body>
	<div style="display: table; margin: 0 auto;">
		<table>
		<tr><th colspan="4">PREMI NON RITIRATI</th></tr>
		<tr>
			<th>Cliente</th>
			<th>Premio</th>
			<th>Data</th>
			<th>Ritirato</th>
		</tr>
		<?=$table?>
		</table>
		
		<table>
		<tr><th colspan="4">PREMI DEL GIORNO</th></tr>
		<tr>
			<th>Cliente</th>
			<th>Premio</th>
			<th>Data</th>
			<th>Ritirato</th>
		</tr>
		<?=$table2?>
		</table>
		
		<table>
		<tr><th colspan="4">PREMI</th></tr>
		<tr>
			<th>Nome</th>
			<th>Previsti</th>
			<th>Usciti</th>
			<th>Rimanenti</th>
		</tr>
		<?= $premi; ?>
		</table>
	</div>
</body>
</html>