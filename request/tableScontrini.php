<?php 

use Models\Action;


include('../inc/mysql.inc.php');



$importo = str_replace(',','.',$_GET['importo']);
$barcode = $_GET['barcode'];
$esercizio = $_GET['esercizio'];
$numero = $_GET['numero'];
//$data = $_GET['data'];
$data = date("Y-m-d");
$voto = $_GET['voto'];
$today = date("Y-m-d");


$check =$_GET['check'];
$giglicardnumber =$_GET['card'];





$giococompleto = Action::ControlloCompleto($dbc);


$getEsercizio = Action::controlloinsegna($esercizio,$dbc);

$completo = $giococompleto->completo;
$coupon = $giococompleto->coupon;
$contascontrini = $giococompleto->contascontrini;
$quesito = $giococompleto->quesito;

$today = date("Y-m-d");
$carrello = Action::scaricocarrello($today,$dbc);
$valore = "-".$carrello->scontrino." days";
//$dataValida = date("Y-m-d", strtotime ($valore));
$dataValida = date("Y-m-d");
$switch_c = null;
$switch = null;
    if ($data < $dataValida) 
    { 
        echo "LO SCONTRINO NON HA DATA VALIDA"; die; 
    }
    $id_user =$_SESSION['user_id'];
    $controllobarcode = Action::controllobarcode ($barcode,$dbc);
    $controlloscontrini = Action::controlloscontrini ($barcode,$dbc);
    if ($controllobarcode) 
    { 
        if ($quesito) 
        {
            $crediti = Action::calcolaGiocate_multiple ($importo, $esercizio,$dbc);
        }
        else
        {
	        $crediti = Action::calcolaGiocate ($importo, $esercizio,$dbc);
             // Controllo che sia valorizzato UNION check la CARD 
            if($check==1 && ($giglicardnumber != null || count($giglicardnumber)>0 ))
            {
                //incremento di 1;
                $crediti++;
            
            }
            var_dump('primo crediti =>'.$crediti);
        }
        if ($contascontrini) 
        {
            if ($controlloscontrini >= $contascontrini) 
            { 
                echo "HAI CARICATO " . $contascontrini . " SCONTRINI NELLA GIORNATA DI OGGI, TORNA LA PROSSIMA VOLTA"; die;
            }
        }

        if ($crediti) 
         { 
            if ($giococompleto->uovo) 
            {
                $numerouova = Action::ControlloUovo($crediti);
?>

	<div id="tableInserimentoUova"></div>
    <?php
            }else{
  


        $switch = null;
        /* controllo crediti in nella tabella newcredito */
        /*vcredito = usata per la visualizzazione a video */

        $vcredito = $crediti;

        $sql ="SELECT credito FROM ".DB_NAME.".".newcredito." WHERE cliente ='{$barcode}'";
        $credito_presente = $dbc->query($sql)->fetch_object()->credito;

       
       

       

        $sql ="SELECT usato FROM ".DB_NAME.".".newcredito." WHERE cliente ='{$barcode}'";
        $usato_presente = $dbc->query($sql)->fetch_object()->usato;
        $crediti = $crediti + ($credito_presente - $usato_presente);
        
        if($crediti <= 5)
        {
                $sql ="SELECT insegna FROM ".DB_NAME.".".PV." WHERE id ='{$esercizio}'";
                $nome_puntovendita = $dbc->query($sql)->fetch_object()->insegna;




                $query = "INSERT INTO ".DB_NAME.".".SCONTRINO." (
                            data_caricamento,
                            idesercizio,
                            importo,
                            giocate_rimaste,
                            operatore,
                            giocate_assegnate,
                            numero_scontrino,
                            data_scontrino,
                            barcode,
                            nome_puntovendita                    
                            )
                            VALUES ( 
                            '".date("Y-m-d H:i:s")."', 
                            '$esercizio', 
                            '$importo', 
                            '$crediti', 
                            '$id_user', 
                            '$crediti',
                            '$numero',
                            '".date("Y-m-d H:i:s")."', 
                            '$barcode',
                            '$nome_puntovendita'
                            )";


                $ret = mysqli_query($dbc,$query);

                //Check se la card/barcode è presente nel database
                
                $update ="SELECT cliente FROM ".DB_NAME.".".newcredito." WHERE cliente ='{$barcode}'";
                $cliente = $dbc->query($update)->fetch_object()->cliente;

        

                if($cliente == null)
                {
                    $insert = "INSERT INTO ".DB_NAME.".".newcredito." (cliente,credito)VALUES ('$barcode','$crediti')";
                    mysqli_query($dbc,$insert);
                    echo "<br>CARICATA " . $vcredito . " Giocata<br><br>";

                }else
                {
                    //Controllo ultimo credito a disposizione del barcode per poter effettuare la somma
              
                    $update = "UPDATE ".DB_NAME.".".newcredito." SET credito='{$crediti}' WHERE cliente='{$cliente}'";
                    mysqli_query($dbc,$update);
                    echo "<br>CARICATA " . $vcredito . " Giocata<br><br>";
                }

        }else{
            echo "<br>IMPOSSIBILE CARICARE <b style='font-size:18px;'>" . $vcredito . "</b> GIOCATE IN QUANTO LA CARD CONTIENE GIA' <b style='font-size:18px;'>" .($credito_presente - $usato_presente)."</b> GIOCATE, SUPERANDO IL LIMITE DI <b style='font-size:18px;'> 5 </br><br/>";
        }//chiudo if
    

    if ($completo) 
    {               
          
        $query1="SELECT 
            barcode as Barcode, 
		    nome as Nome, 
		    cognome as Cognome, 
		    comune as Comune, 
		    telefono as Telefono, 
		    mobile as Mobile, 
		    email as Mail,
            privacy as Dati_Personali,
            privacy2 as Pubblicita
                    FROM ".DB_NAME.".".ACCREDITAMENTO." WHERE barcode = '$barcode'";
                         
          $result=mysqli_query($dbc,$query1);
          
          
        
        while ($rdb=mysqli_fetch_array($result, MYSQLI_ASSOC))
        {
           
             if ((!$rdb['Mobile']) || (!$rdb['Mail']) || (!$rdb['Pubblicita'])) { ?>
              
              <script>
              alert("ATTENZIONE PER ACCEDERE A TUTTI I PREMI DEVI COMPILARE I CAMPI MAIL E ACCETTARE CONSENSO AL TRATTAMENTO DEI DATI PERSONALI AI FINI PUBBLICITARI")
              </script>
        <?php 
        
       if (($rdb['Mobile']) && ($rdb['Pubblicita'])) $switch_c = 1; 
        $switch = 1; } else { $switch_c = 1; }
       
            foreach ($rdb as $name => $value)
            {
                     if (!is_numeric($name))
                     {
                        $rdb["$name"] = trim($rdb["$name"]);  
                        $rdb["$name"] = stripslashes($rdb["$name"]);
                     };
            };
            
            
            
                 // ----- stampa intestazioni tabella
                
            if (!$i)
            {
                $i=0;
                ?>
              <form id="frm_upd">
                <table width="80%" cellpadding="5" border="1" bordercolor="#E0E0E0">
                <tr align="left">
                <?php
                    foreach ($rdb as $name => $value)
                    {					
                        if (!is_numeric($name))
                     {
                         ?> 
                                <td style="font-weight:bold; font-family:Tahoma"><?=$name?>
                               
                                </td>  
                            <?php
                      }; 
                    }; 
                ?>
 
                </tr>
            <?php
            };
            
            // ----- stampa righe tabella 
             
            ?>
            
                <tr valign="middle" align="left" <?php if ($i%2 == false) { ?> bgcolor="#fcffc7" <?php } else { ?> bgcolor="#fefff3" <?php }; ?>>    
                <td style="text-transform:uppercase"><input id='barcode' type='hidden' value='<?=$rdb['Barcode']?>'><?=$rdb['Barcode']?></td>
                <td style="text-transform:uppercase"><?=$rdb['Nome']?></td> 
                <td style="text-transform:uppercase"><?=$rdb['Cognome']?></td>
             <td style="text-transform:uppercase"><?=$rdb['Comune']?></td> 
               <td style="text-transform:uppercase"><?=$rdb['Telefono']?></td>
                <td style="text-transform:uppercase"><?php if ($rdb['Mobile']) { echo $rdb['Mobile']; ?><input id='cellulare' type='hidden' value='<?=$rdb['Mobile']?>'><?php } else  { ?><input id='cellulare' type='text' maxlength='70'  size='40' value='<?=$rdb['Mobile']?>' onkeypress="return handleEnter(this, event)" ><?php } ?></td>
                <td style="text-transform:uppercase"><?php if ($rdb['Mail']) { echo $rdb['Mail']; ?><input id='email' type='hidden' value='<?=$rdb['Mail']?>'><?php } else  { ?><input id='email' type='text' maxlength='70'  size='40' value='<?=$rdb['Mail']?>' onkeypress="return handleEnter(this, event)" ><?php } ?></td>
                <td style="text-transform:uppercase"><? if ($rdb['Dati_Personali']) echo "SI"; else  echo "NO"; ?></td>
                <td style="text-transform:uppercase"><select id="privacy2" >
                        <?php if ($rdb['Pubblicita']) { ?>
            <option value="<?=$rdb['Pubblicita']?>" selected><?php if ($rdb['Pubblicita']) echo "SI"; else echo "NO"; ?></option>
            <?php } else { ?>
            <option value="<?=$rdb['Pubblicita']?>" selected><?php if ($rdb['Pubblicita']) echo "SI"; else echo "NO"; ?></option>
            <option value="1">SI</option>
            <option value="0">NO</option>
            </select>
                
         <?php
            }
            $i++;
        };
 ?> </table> <br><br>
       <?php if ($switch) { ?>
        <input type="button" name="invioupd" id="invioupd" value="Aggiorna il Profilo del cliente" />
         <input type="button" name="noinvioupd" id="noinvioupd" value="Il cliente non desidera aggiornare il Profilo" />
      <?php
         } else {
             if (!$switch_card)
         echo "IL CLIENTE HA LA POSSIBILITA' DI ACCEDERE A TUTTI I PREMI";
         } 
         ?>
              </form>
              <br><br>
              <?php 
              if ($switch_c) { 
			  if ($coupon) { ?>
              <p><a class="btnPrint" href='liberatorie/liberatoria_webcard.php?barcode=<?=$barcode?>'>STAMPA COUPON PER PARTECIPARE AL GIOCO ONLINE</a></p>
              <?php } } ?>
        <div id="tableUpdate"></div>
<?php                                     
} } } else {
echo "DEVI CARICARE ALMENO " . $getEsercizio->valore . " EURO";
} } else { 
echo "LA CARD NON ESISTE";
}
?>

  