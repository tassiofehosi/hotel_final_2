<?php

include('connect_BD.php');

extract ($_POST);
$data = date('Y-m-d');

$sql = "INSERT INTO contato(Nome, Email, Assunto, Mensagem, Data) VALUES('$nome', '$email', '$assunto', '$mensagem', '$data')";

if (mysql_query($sql)) {
	echo "<script>alert('Mensagem enviada com sucesso! Obrigado!.');</script>";
	echo "<meta http-equiv='refresh' content='0, url=contato.html'>";
}else{
	echo "<script>alert('Erro de envio da mensagem! Tente mais tarde.');</script>";
	echo "<meta http-equiv='refresh' content='0, url=contato.html'>";
}

?>


