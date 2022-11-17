<?php

try {
    // On se connecte à MySQL et à notre base de données.
    $pdo = new PDO(
        'mysql:host=localhost;dbname=messagerie;charset=utf8',
        "admin",
        "password"
    );
} catch (PDOException $e) {
    // En cas d'erreur, on affiche un message et on arrête tout
    echo('Erreur : '.$e->getMessage());
}



