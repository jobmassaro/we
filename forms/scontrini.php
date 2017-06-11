 <?php

use Models\Action;

session_start();

include('../inc/mysql.inc.php');

$giococompleto = Action::ControlloCompleto($dbc);


?>
<div id="tabs-1">

    <form id="frm1">
    
      <table width="100%" border="0">
        <tr>
          <td><label for="barcode1">Barcode </label></td>
          <td><input type="text" name="barcode1"  id="barcode1" size="11" onkeypress="return handleEnter(this, event)" autofocus/></td>
        </tr>
        <tr>
          <td> Esercizio:</td>
            <td><select name="esercizio1" id="esercizio1">
              <option value="">Scegli...</option>
              <?php
			            $concorsi = Action::getEsercizio(null, $dbc);
                  if ($concorsi) 
                  {
	                  foreach($concorsi as $c)
                    {
	                      if ($c) 
                        {
		          ?>
              <option value="<?=$c->id?>"><?=$c->insegna?></option>
              <?php } } } ?> 
            </select></td></tr>
            <tr><td>Importo:</td>
           <td> <input type="text" name="importo1" id="importo1" onkeypress="return handleEnter(this, event)"/></td>
        </tr>
        <tr><td>Numero Scontrino:</td>
           <td> <input type="text" name="numero1" id="numero1" onkeypress="return handleEnter(this, event)" required/></td>
        </tr>
        <!--tr><td>Data emissione:</td>
           <td> <input type="text" name="data1" id="datepicker50" onkeypress="return handleEnter(this, event)"/></td>
        </tr>-->
		<?php if ($giococompleto->voto) { ?>
		 <tr><td>Voto Punto Vendita:</td>
           <td> <select name="voto1" id="voto1">
              <option value="">Scegli...</option>
			  <?php for ($i=1;$i<=10;$i++) { ?>
			 <option value="<?=$i?>"><?=$i?></option>
			 <?php } ?> 
            </select></td>
        </tr>
		<?php } ?>
      </table>
      <table width="100%" border="0">
  <tr>
    <td>
    <br />
<input type="button" name="invio1" id="invio1" value="Registra Scontrini"  class="btn btn-primary btn-lg"/>
	<!--input type="button" name="r_exp_invio" id="r_exp_invio" value="Esporta report" /-->
	</td></tr></table>
	</form><br>
    <div id="tableScontrini"></div>
		
  </div>


  <script>
  
$("#invio1").click(function() {
			if ($("#barcode1").val() == '') {
			alert("ATTENZIONE BARCODE MANCANTE")
			frm1.barcode1.focus();
				return false; }
			if ($("#esercizio1").val() == '') {
			alert("ATTENZIONE ESERCIZIO MANCANTE")
			frm1.esercizio1.focus();
				return false; }
				
			if ($("#numero1").val() == '') {
			alert("ATTENZIONE SCONTRINO MANCANTE")
			frm1.numero1.focus();
				return false; }
				
				if ($("#importo1").val() == '') {
			alert("ATTENZIONE IMPORTO MANCANTE O TROPPO BASSO")
			frm1.importo1.focus();
				return false; }
				
				if ($("#importo1").val() < 5) {
			alert("DEVI CARICARE ALMENO 5 EURO")
			frm1.importo1.focus();
				return false; }
				
                       
                            $('#tableScontrini').hide();
	    $('#tableScontrini').html("");
		$.get('../request/tableScontrini.php',{'esercizio':$('#esercizio1').val(),'numero':$('#numero1').val(),'data':$('#datepicker50').val(),'barcode':$('#barcode1').val(),'importo':$('#importo1').val(),'voto':$('#voto1').val(),'application':'concorsi'},function(html){
	 $('#tableScontrini').show();
		   $('#tableScontrini').html(html);
                   $('#frm1')[0].reset();
		}); 
                            
});
</script>