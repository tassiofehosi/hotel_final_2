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
<table width="100%" border="1">
			<tr>
				<td><b>cpf_cliente</b></td>
				<td><b>Nome_cliente</b></td>
				<td><b>Sexo</b></td>
				<td><b>Email</b></td>
				<td><b>CEP</b></td>
				<td><b>Endereco</b></td>
				<td><b>Telefone</b></td>
				<td><b>Cidade</b></td>
				<td><b>Estado</b></td>
				<td><b>Profissao</b></td>
				<td align="center"><b>Editar</b></td>
				<td align="center"><b>Deletar</b></td>
			</tr>
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