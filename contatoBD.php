<?php

include('connect_BD.php');

extract ($_POST);
$data = date('Y-m-d');

$sql = "INSERT INTO contato(Nome, Email, Assunto, Mensagem, Data) VALUES('$nome', '$email', '$assunto', '$mensagem', '$data')";

if (mysql_query($sql)) {
	header('Location: contato.html?resultado=ok');
}else{
	header('Location:contato.html?resultado=falso');
}

?>