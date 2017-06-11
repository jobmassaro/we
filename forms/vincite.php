<div id="tabs-4">
	<form id="frm4">
    <table width="100%" border="0">
<tr>
    <td>	
	<label for="barcode4">Barcode </label></td><td>
<input type="text" name="barcode4"  id="barcode4" size="11" onkeypress="return handleEnter(this, event)" autofocus/></td>
<!--
<tr>
    <td>
	<label for="cognome4">Cognome </label></td><td>
<input type="text" name="cognome4"  id="cognome4" size="11" onkeypress="return handleEnter(this, event)"/>
</td></tr>
-->
<!--
<tr>
    <td>	
	<label for="data">Data Giocata </label></td><td>
<input type="text" name="data4"  id="datepicker60" size="11" onkeypress="return handleEnter(this, event)" autofocus/></td>
<tr>
-->
</table>
<table width="100%" border="0">
<tr>
    <td>
    <br />
<input type="button" name="invio4" id="invio4" value="Controlla" class="btn btn-primary btn-lg"/>
	<!--input type="button" name="r_exp_invio" id="r_exp_invio" value="Esporta report" /-->
	</td></tr></table>
		</form>
		<div id="tableGiocata"></div>
	<iframe src="report.php" width="100%" height="400px" frameborder="0"></iframe>
		
	</div>

	<script>
	$("#invio4").click(function() 
	{ 
	// resetto eventuali errori visualizzati da un click precedente
	    $('#tableGiocata').hide();
	    $('#tableGiocata').html("");
		$.get('../request/tableGiocata.php',{'data':$('#datepicker60').val(),'cognome':$('#cognome4').val(),'barcode':$('#barcode4').val(),'application':'concorsi'},function(html){
		 $('#tableGiocata').show();
		   $('#tableGiocata').html(html);
                   $('#frm4')[0].reset();
		}); 
		});
	</script>