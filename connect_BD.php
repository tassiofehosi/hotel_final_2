<?php

$connect = mysql_connect('localhost', 'root', '');
$selectDB = mysql_select_db('hotel', $connect) or die(mysql_error());

?>