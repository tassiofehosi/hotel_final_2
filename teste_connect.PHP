<?php

$link = mysql_connect('localhost:3306', 'root', 'xampp');
if (!$link) {
    die('Não foi possível conectar: ' . mysql_error());
}
echo 'Conexão bem sucedida';
mysql_close($link);


?>

<?php

$db_selected = mysql_select_db('hotel', $link);
if (!$db_selected) {
    die ('Não foi possivel selecionar o BD hotel : ' . mysql_error());
}else{
	echo "Selecao DB 'hotel' bem sucedida"; 
}
?> 

<?php
	mysql_close($link);
?>
