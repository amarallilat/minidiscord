<?php
header("Acces-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Max-Age: 3600");

session_start();

// //On récupére $_GET et selon ce qui est passé en paramètre, on appelle la fonction adaptée
// //Url appellant la fonction test : https://noframe.dev.accatone.net/assistants/mathias.tranzer/minidiscord/demo_api.php?action=test
// //Url appelant la fonction testData : https://noframe.dev.accatone.net/assistants/mathias.tranzer/minidiscord/demo_api.php?action=test_data
    
switch ($_GET['action']) {
    case 'test':
        $retour = test();
        break;
    case 'getAllUsers':
        $retour = getAllUsers();
        break;
    case 'selectMessagesPublics':
        $retour = selectMessagesPublics();
        break;
    case 'selectCompleteInfoUser':
        $retour = selectCompleteInfoUser();
        break;
    case 'selectInfoUser':
        $retour = selectInfoUser();
        break;
    case 'selectMessagePrive':
        $retour = selectMessagePrive();
        break;
    case 'getSession':
        $retour = getSession();
        break;
    case 'ajoutMessagePrive':
        $retour = ajoutMessagePrive($_POST);
        break;
    case 'ajoutMessagePublic':
        $retour = ajoutMessagePublic($_POST);
        break;
    case 'connexion':
        $retour = connexion($_POST);
        break;
    case 'deconnexion':
        $retour = deconnexion();
        break;
    case 'inscription':
        $retour = inscription($_POST);
        break;
    default:
        $retour = null;
        http_response_code(404);   
}

// //Le retour de la fonction (un tableau PHP) est converti en JSON puis est affiché avec echo
echo json_encode($retour);
        
function test()
{
    $test = ["message" => "Bien reçu"];
    return $test;
}

function deconnexion()
{
    $_SESSION = [];

    session_destroy();

    $test = ["message" => "deconnexion"];
    return $test;
}

function ajoutMessagePrive($data)
{
    require('bddconfig.php');
    $sql = "insert into message (contenu,id_expediteur,id_recepteur,heure) values (:contenu,:id_expediteur,:id_recepteur,:heure)";
    $insert = $pdo->prepare($sql);
    $insert->execute([
        "contenu" => $data["contenu"],
        "id_expediteur" => $_SESSION["id"],
        "id_recepteur" => $data["id_recepteur"],
        "heure" => date("Y-m-d H:i:s")
    ]);
    $test = "message envoyé";
    return $test;
}

function ajoutMessagePublic($data)
{
    // if(!empty($data["contenu"])){
        require('bddconfig.php');
        $sql = "insert into message (contenu,id_expediteur,id_recepteur,heure) values (:contenu,:id_expediteur,:id_recepteur,:heure)";
        $date = date("Y-m-d H:i:s");
        $insert = $pdo->prepare($sql);
        $insert->execute([
            "contenu" => $data["contenu"],
            "id_expediteur" => $_SESSION["id"],
            "id_recepteur" =>null,
            "heure" => $date
        ]);
        $test = "message public envoyé";
    // } else {
    //     $test = "message vide";
    // }
    return $test;
}


function connexion($data)
{
    require('bddconfig.php');
    
    if (isset($data["email"]) && isset($data["password"])) {
        $sql = "select * from utilisateur where email = :email";
        $select = $pdo->prepare($sql);
        $select->execute(["email" => $data["email"]]);
        $result = $select->fetch();
        if($result == true) {
            if($data["password"] == $result["password"]) {
                $_SESSION["id"] = $result["id"];
                $_SESSION["pseudo"] = $result["pseudo"];
                $_SESSION["avatar"] = $result["avatar"];
    
                $test = "aaa";
                return $test;
            } else {
                $test = "bbb";
                return $test;
            }
        } else {
            $test = "ccc";
            return $test;
        }
    }
}

function selectMessagePrive() {
    require('bddconfig.php');

    $id = $_POST["id_expediteur"];

    // on veut les message que la personne connecté a reçu de lui
    $sql = "select contenu,heure,u1.id as idexpediteur,u1.nom as nom,u1.prenom as prenom,u1.email as email,u1.avatar as avatar,u1.pseudo from message join utilisateur as u1 on u1.id = id_expediteur join utilisateur as u2 on u2.id = id_recepteur
    where (id_recepteur = :id_recepteur and id_expediteur = :id_expediteur) or (id_recepteur = :id_recepteur2 and id_expediteur = :id_expediteur2) order by heure";
    $select = $pdo->prepare($sql);
    $select->execute([
        "id_recepteur" => $_SESSION["id"],
        "id_expediteur" => $id,
        "id_recepteur2" => $id,
        "id_expediteur2" => $_SESSION["id"]
    ]);
    $resultat = $select->fetchAll(PDO::FETCH_ASSOC);
    return $resultat;
}

function getSession() {
    $session = $_SESSION;
    return $session;
}


function selectInfoUser() {
    require('bddconfig.php');

    $id = $_POST["id_expediteur"];

    // on veut les message que la personne connecté a reçu de lui
    $sql = "select id,avatar,nom,prenom,pseudo from utilisateur where id = :id";
    $select = $pdo->prepare($sql);
    $select->execute([
        "id" => $id
    ]);
    $resultat = $select->fetch(PDO::FETCH_ASSOC);
    return $resultat;
}

function selectCompleteInfoUser() {
    require('bddconfig.php');

    $id = $_POST["id_expediteur"];

    // on veut les message que la personne connecté a reçu de lui
    $sql = "select id,avatar,nom,prenom,pseudo,email from utilisateur where id = :id";
    $select = $pdo->prepare($sql);
    $select->execute([
        "id" => $id
    ]);
    $resultat = $select->fetch(PDO::FETCH_ASSOC);
    return $resultat;
}

function selectMessagesPublics() {
    require('bddconfig.php');

    $sql = "select * from message join utilisateur on utilisateur.id = id_expediteur order by heure";
    $select = $pdo->prepare($sql);
    $select->execute();
    $resultat = $select->fetchAll(PDO::FETCH_ASSOC);

    return $resultat;
}

function getAllUsers() {
    require('bddconfig.php');
    $sql = "select * from utilisateur where not id = :id order by pseudo";
    $select = $pdo->prepare($sql);
    $select->execute(["id" => $_SESSION["id"]]);
    $resultat = $select->fetchAll(PDO::FETCH_ASSOC);
    
    return $resultat;
}

function inscription($data) {
    require('bddconfig.php');
    if(isset($data["nom"]) && !empty($data["nom"]) && isset($data["prenom"]) && !empty($data["prenom"])  && isset($data["emailInsc"]) && !empty($data["emailInsc"])  && isset($data["passwordInsc"]) && !empty($data["passwordInsc"])  && isset($data["password2"]) && !empty($data["password2"])  && isset($data["pseudo"]) && !empty($data["pseudo"])) {
        if($data["passwordInsc"] == $data["password2"]) {
            $passwordHash = password_hash($data["passwordInsc"],PASSWORD_DEFAULT);
            $sql = "insert into utilisateur(nom,prenom,email,password,pseudo) values (:nom,:prenom,:email,:password,:pseudo)";
            $insert = $pdo->prepare($sql);
            $insert->execute([
                "nom" => $data["nom"],
                "prenom" => $data["prenom"],
                "email" => $data["emailInsc"],
                "password" => $passwordHash,
                "pseudo" => $data["pseudo"]
            ]);
            $test = "vous etes bien inscrit";
        } else {
            $test =  "les mots de passes sont pas identiques(achete des lunettes)";
        }
    } else {
        $test =  "des champs sont vides(envoi pas de formulaire vide ou je te frappe)";
    }
    return $test;
}