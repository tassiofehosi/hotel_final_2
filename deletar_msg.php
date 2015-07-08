<?php

include('connect_BD.php');

$msg = $_GET['Reg_Nr'];

mysql_query("DELETE FROM contato WHERE Reg_Nr ='$msg'") or die(mysql_error());

?>

<script type="text/javascript">
	
	alert("A mensagem do registro Nr. <?php echo $msg ?> foi deletado com sucesso");
	window.location.href = "painel_admin.php";

</script>