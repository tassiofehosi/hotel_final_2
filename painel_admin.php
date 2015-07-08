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
	<link rel="stylesheet" type="text/css" href="css/estilo2.css">

</head>
<body>
	<header>
		<div class="header"><h3>BEM VINDO AO SISTEMA DE MONITORAMENTO DE RESERVAS DO HOTEL PARAISO DA ÁGUAS</h3>
		<a href="?go=sair">SAIR</a>
		</div><br><br>
	</header>
			<!--inicio das mensagens da pág. contato-->
		<table class="tab_cad" width="100%" border="1">
	<tr><h3>Mensagens recebidas da pág. contato:</h3></tr>
			<tr>
				<td><b>Registro Nr.</b></td>
				<td><b>Nome do contato</b></td>
				<td><b>Email</b></td>
				<td><b>Assunto</b></td>
				<td><b>Mensagem</b></td>
				<td><b>Data</b></td>
				<td align="center"><b>Deletar</b></td>
			</tr>
			<?php
				$query = mysql_query("SELECT * FROM contato ORDER BY Data") or die(mysql_error());
				while ($linha = mysql_fetch_object($query)) {
									
			?>
			<tr>
				<td><?php echo $linha->Reg_Nr ?></td>
				<td><?php echo $linha->Nome ?></td>
				<td><?php echo $linha->Email ?></td>
				<td><?php echo $linha->Assunto ?></td>
				<td><?php echo $linha->Mensagem ?></td>
				<td><?php echo $linha->Data ?></td>
				<td align="center"><a href="deletar_msg.php?Reg_Nr=<?php echo $linha->Reg_Nr ?>"><img src="img/eliminar.gif"></a></td>

			</tr>

		<?php
		}
		?>
		</table>
	<!--fim das mensagens da pág. contato-->
	<!--inicio da tabela de clientes-->
<table class="tab_cad" width="100%" border="1">
	<tr><h3>Tabela de cadastro de clientes:</h3></tr>
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
		</table>
		<!--fim da tabela de clientes-->
		<!--inicio da tabela de reservas-->
		<table class="tab_cad" width="100%" border="1">
	<tr><h3>Relação das reservas dos apartamentos:</h3></tr>
			<tr>
				<td><b>Numero_registro</b></td>
				<td><b>CPF_cliente</b></td>
				<td><b>Numero_apto</b></td>
				<td><b>Data_entrada</b></td>
				<td><b>Data_saida</b></td>
				<td align="center"><b>Editar</b></td>
				<td align="center"><b>Deletar</b></td>
			</tr>
			<?php
				$query = mysql_query("SELECT * FROM hospedagem_reserva ORDER BY Data_entrada") or die(mysql_error());
				while ($linha = mysql_fetch_object($query)) {
									
			?>
			<tr>
				<td><?php echo $linha->Numero_registro ?></td>
				<td><?php echo $linha->CPF_cliente ?></td>
				<td><?php echo $linha->Numero_apto ?></td>
				<td><?php echo $linha->Data_entrada ?></td>
				<td><?php echo $linha->Data_saida ?></td>
				<td align="center"><img src="img/editar.gif"></td>
				<td align="center"><a href="deletar.php?CPF_cliente=<?php echo $linha->CPF_cliente ?>"><img src="img/eliminar.gif"></a></td>

			</tr>

		<?php
		}
		?>
		</table>
		<!--fim da tabela de reservas-->
		<ul class="menu inline sem-marcador">
			<h3>Clique aqui para gerar um PDF da relação de reservas<li><a href="relatoriofpdf.php">gerar PDF &raquo;</a></li></h3>
			
		</ul>
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