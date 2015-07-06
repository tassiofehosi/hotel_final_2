<!DOCTYPEhtml>
<?php
session_start();
if(!isset($_SESSION['user_session']) && !isset($_SESSION['pwd_session'])){
	echo "<meta http-equiv='refresh' content='0, url=./'>";
}else{
?>
<html lang="pt-br">
<head>
	<title>admin</title>
	<meta charset="utf-8"/>

</head>
<body>
<h3>BEM VINDO AO SISTEMA DE MONITORAMENTO DE RESERVAS DO HOTEL PARAISO DA ÁGUAS</h3> |
<a href="?go=sair">SAIR</a>
</body>
</html>
<?php
	}

	if(@$_GET['go'] == 'sair'){
		unset($_SESSION['user_session']);
		unset($_SESSION['pwd_session']);
		echo"<meta http-equiv='refresh' content='0, url=index.php'>";
	}
?>