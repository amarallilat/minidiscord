<?php

require('bddconfig.php');

$email = filter_input(INPUT_POST,"email");
$password = filter_input(INPUT_POST,"password");

if (isset($email) && isset($password)) {
    $sql = "select * from utilisateur where email = :email";
    $select = $pdo->prepare($sql);
    $select->execute(["email" => $email]);
    $result = $select->fetch();
    if($result == true) {
        if($password == $result["password"]) {
            session_start();
            $_SESSION["id"] = $result["id"];
            $_SESSION["pseudo"] = $result["pseudo"];
            $_SESSION["avatar"] = $result["avatar"];

            header("Location: home.php");
        } else {
            echo "mauvais mot de passe";
        }
    } else {
        echo "cet email n'existe pas";
    }
}