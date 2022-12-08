let email = document.querySelector("#email");
let password = document.querySelector("#password");
let error = document.querySelector("#error");
let nom = document.querySelector("#nom");
let prenom = document.querySelector("#prenom");
let pseudo = document.querySelector("#pseudo");
let emailInsc = document.querySelector("#emailInsc");
let passwordInsc = document.querySelector("#passwordInsc");
let password2 = document.querySelector("#password2");

email.addEventListener("keypress", enter);
password.addEventListener("keypress", enter);

async function connexion() {
    let url = "apimessagerie.php?action=connexion";
    let donnees = new FormData();
    donnees.append("email", email.value);
    donnees.append("password", password.value);
    let data = {
        method: "post",
        body: donnees,
    };
    let envoi = await fetch(url, data);

    let retour = await envoi.json();
    let message = "";
    switch (retour) {
        case "aaa":
            document.location.href = "home.php";
            break;
        case "bbb":
            message = "le mot de passe est incorrect";
            showError(message);
            break;
        case "ccc":
            message = "l'utilisateur n'existe pas";
            showError(message);
            break;
    }
}

function enter(e) {
    if (e.keyCode == 13) {
        connexion();
    }
}

function showError(message) {
    error.innerHTML = message;
}

async function inscription() {
    let url = "apimessagerie.php?action=inscription";
    let donnees = new FormData();
    donnees.append("nom", nom.value);
    donnees.append("prenom", prenom.value);
    donnees.append("pseudo", pseudo.value);
    donnees.append("emailInsc", emailInsc.value);
    donnees.append("passwordInsc", passwordInsc.value);
    donnees.append("password2", password2.value);

    let data = {
        method: "post",
        body: donnees,
    };
    let envoi = await fetch(url, data);
    let reponse = await envoi.json();
    console.log(reponse);
}
