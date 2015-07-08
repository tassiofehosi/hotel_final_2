<?php
include('connect_BD.php');
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html, charset=utf-8">
	<title>LOGIN ADMIN HOTEL</title>
	<link rel="stylesheet" type="text/css" href="css/estilo2.css">
</head>
<body>
	<div ID="cadastro">
		<header>
		<div class="header"><h3>SISTEMA DE GERENCIAMENTO DE RESERVAS DO HOTEL PARAISO DA ÁGUAS</h3>
		<a href="index.php">LOGIN &raquo;</a><!--<a href="?go=sair">SAIR</a>-->
		</div>
	</header>
		<form method="post" action="?go=cadastrar">
			<table id="cad_table">
					<td>Nome:</td>
					<td><input type="text" name="nome" id="nome" class="txt"/></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" id="email" class="txt"/></td>
				</tr>
				<tr>
					<td>Usuário:</td>
					<td><input type="text" name="user" id="user" class="txt" maxlength="15"/></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" name="senha" id="senha" class="txt" maxlength="15"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="cadastrar" id="btnCAD">
						&nbsp;<a href="index.html"><input type="button" value="SAIR" class="btn" id="btnsair"></a></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>

<?php
if (@$_GET['go'] =='cadastrar'){
	$nome = $_POST['nome'];
	$email = $_POST['email'];
	$user = $_POST['user'];
	$pwd = $_POST['senha'];
	if (empty($nome)){
		echo "<script>alert('Preencha todos os campos para se cadastrar.'); history.back();</script>";
	}elseif(empty($email)){
		echo "<script>alert('Preencha todos os campos para se cadastrar.'); history.back();</script>";
	}elseif(empty($user)){
		echo "<script>alert('Preencha todos os campos para se cadastrar.'); history.back();</script>";
	}elseif (empty($pwd)){
		echo "<script>alert('Preencha todos os campos para se cadastrar.'); history.back();</script>";
	}else{
		$query1 = mysql_num_rows(mysql_query("SELECT * FROM FUNCIONARIO WHERE USUARIO = '$user'"));
		if ($query1 == 1) {
			echo "<script>alert('Usuario já existe.'); history.back();</script>";
		}else{
			mysql_query("insert into funcionario (nome, email, usuario, senha) values('$nome','$email','$user','$pwd')");
			echo "<script>alert('Usuario cadastrado com sucesso!.');</script>";
			echo "<meta http-equiv='refresh' content='0, url=index.php'>";
			//header("location: cadastfuncio.php");
		}
	}	
}
?>

	