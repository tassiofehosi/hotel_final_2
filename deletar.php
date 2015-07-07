<?php

include('connect_BD.php');

$cpf = $_GET['CPF_cliente'];

mysql_query("DELETE FROM cliente WHERE CPF_cliente ='$cpf'") or die(mysql_error());

?>

<script type="text/javascript">
	
	alert("o cadastro do cpf <?php echo $cpf ?> foi deletado com sucesso");
	window.location.href = "painel_admin.php";

</script>