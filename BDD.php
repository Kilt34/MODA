<?php
/**
 * Base de données
 */
$user = "root";
$pwd = "mysql";
$bdd = "MODA";
global $link;
$link = mysql_connect("localhost", $user, $pwd) or die("Impossible de se connecter : " . mysql_error());
mysql_select_db($bdd, $link) or die("Impossible de choisir la bdd : " . mysql_error());
?>