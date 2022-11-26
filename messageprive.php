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
        <link rel="stylesheet" href="./css/messageprive.css" />
    </head>
    <body>
        <div class="liste">
            <div class="nav">
         
                <a href="messageprive.php">
                <img class="ariere" src="./images/logo.png" alt="logoo" />
                </a>
                <p class="pointier">----</p>
                <a href="home.php">
                    <h1 class="public">P</h1>
                </a>
                <p class="pointier">----</p>
              <a href="#">
                <img class="logoG" src="./images/luffi.jpg" alt="luffi">
              </a>
              <p class="pointier">----</p>
              <a href="index.html">
              <i id="deconnexion" class="fa-solid fa-5x fa-power-off"></i>
              </a>
            </div>
            <div class="liste">
                <div class="list">
               
                    <p class="titre">Les messages privés</p>
                    

                    <div id="listeUsers" class="entremsg">
                        <div>
                           <input class="recherches" type="text"placeholder="Recherches:">   
                        </div>

                    </div>
                </div>

                <div class="entremsgs">
                    <div class="listes">
                        <div id="messagesPrives" class="align"></div>
                        <div class="form">
                            <input
                                id="message"
                                class="gris"
                                type="text"
                                name="Messages"
                                placeholder="Ecrire un message à Amar ideuh..."
                            />

                            <input onclick="envoyerMessagePrive()" class="bleu" type="submit" value="Envoyer">
                        </div>
                    </div>
                </div>
                <div id="user"></div>
            </div>
        </div>
        <script src="messageprive.js"></script>
    </body>
</html>
