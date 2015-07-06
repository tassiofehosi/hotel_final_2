<?php
session_start();
include('connect_BD.php');
if(!isset($_SESSION['user_session']) && !isset($_SESSION['pwd_session'])){

?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html, charset=utf-8">
	<title>LOGIN ADMIN HOTEL</title>
	<link rel="stylesheet" type="text/css" href="css/estilo2.css">
</head>
<body>
	<div ID="cadastro">
		<form method="post" action="?go=logar">
			<table id="login_table">
				<tr><h2>SISTEMA DE MONITORAMENTO DE RESERVAS DO HOTEL</h2></tr>
				<tr>
					<td>Usuário:</td>
					<td><input type="text" name="user" id="user" class="txt" maxlength="15"/></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" name="senha" id="senha" class="txt" maxlength="15"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Entrar" class="btn" id="btnCAD">
						&nbsp;<a href="cadastfuncio.php"><input type="button" value="Cadastre-se" class="btn" id="btnCAD"></a></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>
<?php
	}else{
		echo "<meta http-equiv='refresh' content='0, url=painel_admin.php'>";
	}

?>

<?php
if (@$_GET['go'] =='logar'){
	$user = $_POST['user'];
	$pwd = $_POST['senha'];
	if(empty($user)){
		echo "<script>alert('Preencha todos os campos para entrar.'); history.back();</script>";
	}elseif (empty($pwd)){
		echo "<script>alert('Preencha todos os campos para se entrar.'); history.back();</script>";
	}else{
		$query1 = mysql_num_rows(mysql_query("SELECT * FROM FUNCIONARIO WHERE USUARIO = '$user' AND SENHA = '$pwd'"));
		if ($query1 == 1) {
			$_SESSION['user_session'] = $user;
			$_SESSION['pwd_session'] = $pwd;
			echo "<script>alert('Usuario logado com sucesso.');</script>";
			echo "<meta http-equiv='refresh' content='0, url=painel_admin.php'>";
		}else{
			echo "<script>alert('Usuario e/ou senha  inválida ou não cadastrado!.'); history.back();</script>";
			echo "<meta http-equiv='refresh' content='0, url=./'>";
			//header("location: cadastfuncio.php");
		}
	}	
}
?>