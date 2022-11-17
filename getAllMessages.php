<?php

require('bddconfig.php');

$sql = "select * from message join utilisateur on utilisateur.id = id_expediteur order by heure";
$select = $pdo->prepare($sql);
$select->execute();
$resultat = $select->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($resultat);