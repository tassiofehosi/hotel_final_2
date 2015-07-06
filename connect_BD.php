<meta charset="utf-8"/>
<?php

$connect = @mysql_connect('localhost', 'root', '') or die("Não foi possivel conectar com o servidor de dados");
$selectDB = mysql_select_db('hotel', $connect) or die(mysql_error());

?>