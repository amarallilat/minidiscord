<?php

session_start();

if(!isset($_SESSION["id"])) {
    header("Location: index.html");
}

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Itim&display=swap"
            rel="stylesheet"
        />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        />
        <link rel="stylesheet" href="./css/home.css" />
    </head>
    <body>
        <div class="msgpub">
            <div class="nav">
                <h1 class="ariere">P</h1>
                <p class="pointille">----</p>
                <img
                    class="logo"
                    src="./images/logo.png"
                    alt="logoo"
                />
                <p class="pointille">----</p>
                <i id="deconnexion" class="fa-solid fa-5x fa-power-off"></i>
            </div>

            <div class="listedis">
                <div>
                    <p class="titre marg">Messages Publics</p>
                    <div id="main" class="entremsg"></div>
                </div>
                <div class="form">
                    <input id="messagePublic" class="gris" type="text" name="Messages" placeholder="Ecrire un message public..."/>
                    <input id="submitMessagePublic" class="bleu" type="submit" value="Envoyer"/>
                </div>
                <!-- <button id="neutre">Neutre</button> -->
            </div>

            <div id="aside" class="list"></div>
        </div>
        <script src="home.js"></script>
    </body>
</html>
