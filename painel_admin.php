<!DOCTYPEhtml>
<?php
include('connect_BD.php');
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
<h3>BEM VINDO AO SISTEMA DE MONITORAMENTO DE RESERVAS DO HOTEL PARAISO DA ÁGUAS</h3>
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
			<?php
				$query = mysql_query("SELECT * FROM cliente ORDER BY Nome_cliente") or die(mysql_error());
				while ($linha = mysql_fetch_object($query)) {
					
				
			?>
			<tr>
				<td><?php echo $linha->CPF_cliente ?></td>
				<td><?php echo $linha->Nome_cliente ?></td>
				<td><?php echo $linha->Sexo ?></td>
				<td><?php echo $linha->Email ?></td>
				<td><?php echo $linha->CEP ?></td>
				<td><?php echo $linha->Endereco ?></td>
				<td><?php echo $linha->Telefone ?></td>
				<td><?php echo $linha->Cidade ?></td>
				<td><?php echo $linha->Estado ?></td>
				<td><?php echo $linha->Profissao ?></td>
				<td align="center"><img src="img/editar.gif"></td>
				<td align="center"><a href="deletar.php?CPF_cliente=<?php echo $linha->CPF_cliente ?>"><img src="img/eliminar.gif"></a></td>

			</tr>
		<?php
		}
		?>

<a href="?go=sair">SAIR<br><br></a>


</body>
</html>
<?php
	}
?>
<?php
	if(@$_GET['go'] == 'sair'){
		unset($_SESSION['user_session']);
		unset($_SESSION['pwd_session']);
		echo"<meta http-equiv='refresh' content='0, url=cadastfuncio.php'>";
	}
?>