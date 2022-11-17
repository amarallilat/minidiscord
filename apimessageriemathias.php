<?php
header("Acces-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Max-Age: 3600");

//require("configBdd.php");

//On récupére $_GET et selon ce qui est passé en paramètre, on appelle la fonction adaptée
//Url appellant la fonction test : https://noframe.dev.accatone.net/assistants/mathias.tranzer/minidiscord/demo_api.php?action=test
//Url appelant la fonction testData : https://noframe.dev.accatone.net/assistants/mathias.tranzer/minidiscord/demo_api.php?action=test_data
    
switch ($_GET['action']) {
    case 'test':
        $retour = test();
        break;
    case 'test_data':
        $retour = testData($_POST);
        break;
    case 'fatma':
        $retour = fatma();
        break;
    default:
        $retour = null;
         http_response_code(404);   
        }

        //Le retour de la fonction (un tableau PHP) est converti en JSON puis est affiché avec echo
        echo(json_encode($retour));
        

function test()
{
    $test = array("message" => "Bien reçu");
    return $test;
}

function testData($data)
{
    $test = array("message" => $data);
    return $test;
}

function fatma() {
    $test = "fatma";
    return $test;
}